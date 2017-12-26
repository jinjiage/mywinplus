package com.demo.controller.wenlei;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.demo.model.FinancialPlanner;
import com.demo.service.wenlei.FinancialPlannerServices;
@Controller
@RequestMapping("/sysmember")
public class Controllerlc {
	@Autowired
	FinancialPlannerServices financialPlannerServices;
	@RequestMapping("/financia")
	
	public String list(Integer page, String  Phone ,FinancialPlanner financialPlanner,Map<String,Object> map) {
		if(page==null){
			page=1;	
		} 
		Integer size=2;
		Page<FinancialPlanner> pageemp=financialPlannerServices.fenPage(page, size, financialPlanner ,Phone);
	    map.put("pageemp",pageemp);
	    map.put("financialPlanner",financialPlanner);
		return "/main/vip/financia";	
	}
	
	   @RequestMapping(value="/fin")
		public String listmemberInof(FinancialPlanner financialPlanner ,Map<String,Object> map){
		   Integer status=financialPlanner.getStatus();
		   Integer id=financialPlanner.getId();   
		   financialPlannerServices.queryup(status, id);
	       return "redirect:financia";

	}
}
