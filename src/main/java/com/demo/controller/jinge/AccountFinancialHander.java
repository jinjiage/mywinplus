package com.demo.controller.jinge;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.model.FinancialPlanner;
import com.demo.model.Member;
import com.demo.service.jinge.FinancialPlannerService;

@Controller
@RequestMapping("/account/financial")
public class AccountFinancialHander {
	@Autowired
	FinancialPlannerService financialPlannerService;
	@RequestMapping(value="", method=RequestMethod.GET)
	  public String index(HttpServletRequest request,Model model)
	  {
		Member member = (Member) request.getSession().getAttribute("memberInfo");
	    FinancialPlanner financialPlanner = financialPlannerService.selectMemberId(member.getId());
	    model.addAttribute("financialPlanner", financialPlanner);
	    return "/index/member/financial";
	  }
	  @RequestMapping(value="/add", method=RequestMethod.POST)
	  public String add(FinancialPlanner financialPlanner,HttpServletRequest request)
	  {
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		financialPlanner.setMember(member);
	    financialPlanner.setStatus(0);
	    financialPlanner.setCreate_date(new Date());
	    financialPlanner.setUpdate_date(new Date());
	    financialPlannerService.insertSelective(financialPlanner);
	    return "/index/member/financial";
	  }
}
