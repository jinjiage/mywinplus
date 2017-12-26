package com.demo.controller.jinge;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberTradeRecord;
import com.demo.model.Subject;
import com.demo.model.SubjectPurchaseRecord;
import com.demo.service.jinge.MemberAccountService;
import com.demo.service.jinge.MemberTradeRecordService;
import com.demo.service.jinge.SubjectPurchaseRecordService;
import com.demo.service.jinge.SubjectService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("subjectPur")
public class SubjectPurchaseHander {
	@Autowired
	SubjectService subjectService;
	@Autowired
	MemberTradeRecordService memberTradeRecordService;
	@Autowired
	MemberAccountService memberAccountService;
	@Autowired
	SysTypeService sysTypeService;
	@Autowired
	SubjectPurchaseRecordService subjectPurchaseRecordService;
	@ResponseBody
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public Map<String,Object> order(Integer subjectId,String subjectName, Integer totalFee,HttpServletRequest request)
	{
		Map<String,Object> map = new HashMap();
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		Subject subject = subjectService.getSubject(subjectId);
		if(subject.getStatus()!=1){
			map.put("msg","标的不在募集期");
			return map;
		}
		MemberAccount account = memberAccountService.getMemberAcount(member.getId());
		Date d = new Date();
		SimpleDateFormat sim = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String tradeNO = sim.format(d);
		if(account.getUseable_balance()<totalFee){
			map.put("msg","账户余额不足");
			return map;
		}
		MemberTradeRecord me = new MemberTradeRecord();
		me.setMember_id(member.getId());
		me.setTrade_no(tradeNO);
		me.setTrade_name("购买："+subjectName+";现金金额:"+totalFee);
		me.setAmount(totalFee);
		me.setTrade_type(sysTypeService.getName("subjecttype", subjectId+""));
		me.setFund_flow(0);
		me.setCounterpart("");
		me.setTrade_status(0);
		me.setExt_field_1(subjectId+"");
		me.setExt_field_2(totalFee+"");
		me.setCreate_date(new Date());
		me.setUpdate_date(new Date());
		memberTradeRecordService.save(me);
		map.put("msg", tradeNO);
		map.put("code", 0);
		return map;
	}

	@RequestMapping(value="/orderView", method=RequestMethod.GET)
	private String orderView(String tradeNo, Integer bbinStatus, Model model)
	{
		MemberTradeRecord memberTradeRecord = memberTradeRecordService.getTradeRecordByTradeNo(tradeNo);
		Subject subject = subjectService.getSubject(Integer.parseInt(memberTradeRecord.getExt_field_1()));
		model.addAttribute("yearRate", subject.getYear_rate());
		model.addAttribute("period", subject.getPeriod());
		model.addAttribute("date", new Date());
		model.addAttribute("totalFee", memberTradeRecord.getAmount());
		model.addAttribute("subjectId", subject.getId());
		model.addAttribute("subjectName", subject.getName());
		model.addAttribute("tradeNo", tradeNo);
		model.addAttribute("bbinStatus", bbinStatus);
		return "/index/subject/pay";
	}
	@RequestMapping(value="/orderEnsure/{tradeNo}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> orderEnsure(@PathVariable String tradeNo, HttpServletRequest request)
	{
		Map<String,Object> map = new HashMap();
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		MemberTradeRecord tradeInfo = memberTradeRecordService.getTradeRecordByTradeNo(tradeNo);
		if (tradeInfo == null) {
			map.put("msg", "订单不存在");
			return map;
		}
		Subject subject = subjectService.getSubject(Integer.parseInt(tradeInfo.getExt_field_1()));
		if (subject.getStatus()!=1) {
			map.put("msg", "标的不在募集期");
			return map;
		}

		MemberAccount account = memberAccountService.getMemberAcount(member.getId());	      
		account.setUseable_balance(account.getUseable_balance()-tradeInfo.getAmount());   
		account.setInvest_amount(account.getInvest_amount()+tradeInfo.getAmount());
		account.setImuseale_balance(account.getImuseale_balance()+tradeInfo.getAmount());
		memberAccountService.updateBalance(account);
		request.getSession().removeAttribute("memberAccount");
		request.getSession().setAttribute("memberAccount", account);
		tradeInfo.setTrade_status(1);
		memberTradeRecordService.updateMemberTradeRecord(tradeInfo);
		List<Object[]> list = subjectService.selectList();
		request.getSession().removeAttribute("list");
		request.getSession().setAttribute("list", list);
		SubjectPurchaseRecord subjectPurchaseRecord = new SubjectPurchaseRecord();
		subjectPurchaseRecord.setSerial_number(tradeNo);
		subjectPurchaseRecord.setAmount((double)tradeInfo.getAmount());
		subjectPurchaseRecord.setSubject_id(subject.getId());
		subjectPurchaseRecord.setMember_id(member.getId());
		subjectPurchaseRecord.setCreate_date(new Date());
		subjectPurchaseRecord.setUpdate_date(new Date());
		Double interest = (double) (subject.getYear_rate()/365)*subject.getPeriod();
		subjectPurchaseRecord.setIspayment(0);
		subjectPurchaseRecord.setPay_interest_times(0);
		subjectPurchaseRecord.setInterest(interest);
		subjectPurchaseRecord.setLast_profit_day(0);
		subjectPurchaseRecord.setBonus_info((double)tradeInfo.getAmount()+"-0");
		subjectPurchaseRecordService.save(subjectPurchaseRecord);
		map.put("code", 0);
		map.put("msg", "购买成功!");
		//	      if (bbinStatus.intValue() != 1)
		//	      {
		//	        BigDecimal hasSoldAmount = subject.getHasSold();
		//	        BigDecimal amount = new BigDecimal(tradeInfo.getAmount().doubleValue());
		//	        if ((!subject.getType().equals(SubjectType.GU_SHOU)) && 
		//	          (subject.getAmount().compareTo(hasSoldAmount.add(amount)) < 0)) {
		//	          return ResponseMsg.getError("投资金额过大");
		//	        }
		//
		//	        String[] allfee = tradeInfo.getExtField2().split("-");
		//	        if (new BigDecimal(allfee[0]).setScale(2, 4).compareTo(account.getUseableBalance().setScale(2, 4)) > 0) {
		//	          return ResponseMsg.getError("账户余额不足");
		//	        }
		//	        if (new BigDecimal(allfee[1]).setScale(2, 4).compareTo(account.getBonusAmount().setScale(2, 4)) > 0) {
		//	          return ResponseMsg.getError("账户红包余额不足");
		//	        }
		//
		//	        if (this.subjectPurchaseRecordService.purchaseSubject(tradeInfo, subject, allfee, request.getRemoteAddr())) {
		//	          return ResponseMsg.getOk("购买成功!");
		//	        }
		//	        return ResponseMsg.getError("购买失败！");
		//	      }
		//
		//	      if (!subject.getType().equals(SubjectType.GU_SHOU)) {
		//	        return ResponseMsg.getError("体验金不能购买此类标的");
		//	      }
		//	      if (new BigDecimal(tradeInfo.getAmount().doubleValue()).setScale(2, 4).compareTo(account.getBbinAmount().setScale(2, 4)) > 0) {
		//	        return ResponseMsg.getError("账户体验金不足");
		//	      }
		//
		//	      if (this.subjectPurchaseRecordService.purchaseSubjectBbin(tradeInfo, subject, request.getRemoteAddr())) {
		//	        return ResponseMsg.getOk("购买成功!");
		//	      }
		//	      return ResponseMsg.getError("购买失败！");
		//	    }
		//	    catch (Exception e)
		//	    {
		//	      this._logger.error("PC网站购买支付订单出错了");
		//	      e.printStackTrace();
		//	    }return ResponseMsg.getError("出错了");
		return map;
	}
}
