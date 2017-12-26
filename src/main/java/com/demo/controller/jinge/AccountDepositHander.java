package com.demo.controller.jinge;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.model.Member;
import com.demo.model.MemberBankcards;
import com.demo.model.MemberDepositRecord;
import com.demo.model.SysType;
import com.demo.service.jinge.MemberBankCardService;
import com.demo.service.jinge.MemberDepositRecordService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/account/deposit")
public class AccountDepositHander {
	@Autowired
	MemberDepositRecordService memberDepositRecordService;
	@Autowired
	MemberBankCardService memberBankCardService;
	@Autowired
	SysTypeService sysTypeService;
	@RequestMapping(value="records", method=RequestMethod.GET)
	public String getRecords(@RequestParam(required=false, defaultValue="1") Integer page, 
			@RequestParam(required=false, defaultValue="10") Integer pageSize,HttpServletRequest request, Model model)
	{
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		Page depositRecords = memberDepositRecordService.getDepositRecordsByMemberId(member.getId(), page, pageSize);

		model.addAttribute("depositRecords",depositRecords);
		return "/index/member/deposit";
	}
	@RequestMapping(value="reco", method=RequestMethod.GET)
	public String getRecord(@RequestParam(required=false, defaultValue="1") Integer page, 
			@RequestParam(required=false, defaultValue="10") Integer pageSize,HttpServletRequest request, Model model)
	{
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		Page depositRecords = memberDepositRecordService.getDepositRecordsByMemberId(member.getId(), page, pageSize);

		model.addAttribute("depositRecords",depositRecords);
		return "/index/member/rechargerecode";
	}
	@RequestMapping(value="", method=RequestMethod.GET)
	public String depositForm(HttpServletRequest request, Model model) {
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		MemberBankcards memberBankcards = memberBankCardService.getCard(member.getId(), 0);
		if (memberBankcards != null) {
			model.addAttribute("memberBankcards",memberBankcards);
			return "/index/member/recharge";
		}
		List<SysType> sysType = sysTypeService.find("bank");
		model.addAttribute("sysType",sysType);
		return "/index/member/bankcards";
	}
	@RequestMapping(value="/gopay", method=RequestMethod.POST)
	public String goPay(String fee,HttpServletRequest request,Map<String,Object> map) throws IOException
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str = sdf.format(date);
		Member crtMember =(Member) request.getSession().getAttribute("memberInfo");
		MemberDepositRecord record = new MemberDepositRecord();
		record.setSerial_number(str);
		record.setMember(crtMember);
		record.setAmount(Double.parseDouble(fee));
		record.setCreate_date(new Date());
		record.setUpdate_date(new Date());
		record.setPay_channel_name("支付宝");
		record.setStatus(0);
		memberDepositRecordService.addDepositRecord(record);
		map.put("serial_number", str);
		map.put("amount", fee);
		map.put("subjectname", "充值");
		return "/index/member/alipay.trade.page.pay";
	}
	
}
