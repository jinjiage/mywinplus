package com.demo.controller.jinge;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberBankcards;
import com.demo.model.MemberWithdrawRecord;
import com.demo.model.SysType;
import com.demo.service.jinge.MemberAccountService;
import com.demo.service.jinge.MemberBankCardService;
import com.demo.service.jinge.MemberService;
import com.demo.service.jinge.MemberWithdrawRecordService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/account/withdraw")
public class AccountWithdrawHander {
	@Autowired
	MemberWithdrawRecordService memberWithdrawRecordService;
	@Autowired
	SysTypeService  sysTypeService;
	@Autowired
	MemberService memberService;
	@Autowired
	MemberBankCardService memberBankCardService;
	@Autowired
	MemberAccountService memberAccountService;
	@RequestMapping(value="/records", method=RequestMethod.GET)
	public String getRecords(@RequestParam(required=false, defaultValue="1") Integer page, 
			@RequestParam(required=false, defaultValue="10") Integer pageSize,HttpServletRequest request, Model model)
	{
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		List<SysType> withdrawstatus = sysTypeService.find("withdrawrecordstatus");
		Page records = memberWithdrawRecordService.getWithdrawRecordsByMemberId(member.getId(), page, pageSize);  

		model.addAttribute("records", records);
		model.addAttribute("withdrawstatus", withdrawstatus);
		return "index/member/withdraw";
	}
	@RequestMapping(value="/reco", method=RequestMethod.GET)
	public String getReco(@RequestParam(required=false, defaultValue="1") Integer page, 
			@RequestParam(required=false, defaultValue="5") Integer pageSize,HttpServletRequest request, Model model)
	{
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		List<SysType> withdrawstatus = sysTypeService.find("withdrawrecordstatus");
		Page records = memberWithdrawRecordService.getWithdrawRecordsByMemberId(member.getId(), page, pageSize);  

		model.addAttribute("records", records);
		model.addAttribute("withdrawstatus", withdrawstatus);
		return "index/member/withdrawcashcoder";
	}
	@ResponseBody
	@RequestMapping(value="/setwithdrawpwd", method=RequestMethod.POST)
	public Map<String,Object> regRealInfo(@RequestParam("password") String password,HttpServletRequest request)
	{
		Map<String,Object> map = new HashMap();
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");
		crtMember.setWithdraw_password(password);	
		memberService.saveMember(crtMember);
		map.put("msg", "设置成功");	
		return map;
	}
	@RequestMapping(value="", method=RequestMethod.GET)
	public String withdrawInGen(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="5") Integer pageSize,
			HttpServletRequest request,Map<String,Object> map) { 
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");

		MemberBankcards memberBankcards = memberBankCardService.getCard(crtMember.getId(),0);
		if (memberBankcards == null) {
			return "/index/member/bankcards";
		}
		List<SysType> withdrawstatus = sysTypeService.find("bank");

		MemberAccount memberAccount = memberAccountService.getMemberAcount(crtMember.getId());
		map.put("memberBankcards", memberBankcards);
		map.put("memberAccount", memberAccount);
		map.put("withdrawstatus", withdrawstatus);
		return "/index/member/withdrawcash";
	}
	@ResponseBody
	@RequestMapping(value="/submitWithdraw", method=RequestMethod.POST)
	public Map<String,Object> submitWithdraw(@RequestParam("amount") String amount, @RequestParam("withdrawalPassword") String withdrawalPassword, @RequestParam("bankCard") String bankCard,HttpServletRequest request)
	{
		Map<String,Object> map = new HashMap();
		Member crtMember = (Member) request.getSession().getAttribute("memberInfo");
		if (Double.parseDouble(amount) < 0.0D) {
			map.put("msg", "金额不符");
			return map;
		}
		MemberAccount account = memberAccountService.getMemberAcount(crtMember.getId());
				if (account.getUseable_balance()<Double.parseDouble(amount)) {
					map.put("msg", "余额不足");
					return map;
				}
		if (!crtMember.getWithdraw_password().equals(withdrawalPassword)) {
			map.put("msg", "提款密码错误");
			return map;
		}
		Date now = new Date();
		SimpleDateFormat sim =  new SimpleDateFormat("yyyyMMddssSSS");
		String serial_number = sim.format(now);
		MemberBankcards memberBankcards = memberBankCardService.getCard(crtMember.getId(), 0);
		String bankname=sysTypeService.getName("bank",memberBankcards.getType());
		MemberWithdrawRecord record = new MemberWithdrawRecord();
		record.setAmount(Double.parseDouble(amount));
		record.setBank_card(bankCard);
		record.setBank_name(bankname);
		record.setMember(crtMember);
		record.setSerial_number(serial_number);
		record.setStatus(0);
		record.setCardaddress(memberBankcards.getCardaddress());
		record.setCreate_date(new Date());
		record.setUpdate_date(new Date());
		memberWithdrawRecordService.addMemberWithdrow(record);
		map.put("code", 0);
		return map;
	}
}