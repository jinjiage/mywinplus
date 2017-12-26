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

import com.demo.model.FinanceProductFunds;
import com.demo.model.FinanceProductSubscribe;
import com.demo.model.Member;
import com.demo.model.Subject;
import com.demo.model.SubjectPurchaseRecord;
import com.demo.model.SysType;
import com.demo.service.jinge.FinanceProductFundsService;
import com.demo.service.jinge.FinanceProductSubscribeService;
import com.demo.service.jinge.SubjectPurchaseRecordService;
import com.demo.service.jinge.SubjectService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/account")
public class AccountInvestHander {
	@Autowired
	SubjectService subjectService;
	@Autowired
	SubjectPurchaseRecordService subjectPurchaseRecordService;
	@Autowired
	FinanceProductSubscribeService financeProductSubscribeService;
	@Autowired
	FinanceProductFundsService financeProductFundsService;
	
	 @RequestMapping(value="touZiList", method=RequestMethod.GET)
	  public String jiaoYiJilu(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="1") Integer page1,HttpServletRequest request, Model model)
	  {
		 Member  member = (Member) request.getSession().getAttribute("memberInfo");
		 List<Subject> subjects = subjectService.findSubjectList();
		 Page subjectPurchaseRecords = subjectPurchaseRecordService.getPurchaseRecord(member.getId(), page, 10);
		 Page<FinanceProductSubscribe> financeProductSubscribes = financeProductSubscribeService.getPageFinanceProductSubscribeByMemberId(page1, 10, member.getId());
		List<FinanceProductFunds> financeProductFunds = financeProductFundsService.findFinanceProductFundsList();
		model.addAttribute("subjects",subjects);
		model.addAttribute("subjectPurchaseRecords",subjectPurchaseRecords);
		model.addAttribute("financeProductSubscribes",financeProductSubscribes);
		model.addAttribute("financeProductFunds",financeProductFunds);
	    return "index/member/touzilist";
	  }
	 @RequestMapping(value="tou",method=RequestMethod.GET)
	 public String name() {
		return "/index/member";
	}
}
