package com.demo.controller.jinge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.service.jinge.BbinPurchaseRecordService;
import com.demo.service.jinge.MemberAccountService;

@Controller
@RequestMapping("/account/bbinInfo")
public class AccountBbinInfoHander {
	@Autowired
	MemberAccountService memberAccountService;
	@Autowired
	BbinPurchaseRecordService bbinPurchaseRecordService;
	@RequestMapping(value="/records", method=RequestMethod.GET)
	public String getBin(HttpServletRequest request ,Model model)
	{
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		MemberAccount memberAccount = memberAccountService.getMemberAcount(member.getId());
		Object[] bbinPurchaseRecords = bbinPurchaseRecordService.getBbinPurchase(member.getId());
		model.addAttribute("memberAccount", memberAccount);
		model.addAttribute("bbinPurchaseRecords", bbinPurchaseRecords);
		return "/index/member/bbinInfo";
	}
}
