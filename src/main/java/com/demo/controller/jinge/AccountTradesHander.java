package com.demo.controller.jinge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.model.Member;
import com.demo.model.SysType;
import com.demo.service.jinge.MemberProfitRecordService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/account/trades")
public class AccountTradesHander {
	@Autowired
	MemberProfitRecordService memberProfitRecordService;
	
	 @RequestMapping(value="/profit/records", method=RequestMethod.GET)
	  public String depositForm(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize,
			 HttpServletRequest request, Model model)
	  {
		 Member member = (Member) request.getSession().getAttribute("memberInfo");
		
		 Page memberProfitRecord = memberProfitRecordService.findMemberProfitRecordBymemberId(member.getId(),page,pageSize);
	
		 model.addAttribute("memberProfitRecord", memberProfitRecord);
	    return "/index/member/recoders";
	  }
}
