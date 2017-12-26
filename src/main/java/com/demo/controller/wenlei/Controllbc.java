package com.demo.controller.wenlei;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.MemberBankcards;
import com.demo.model.SubjectOrderRecord;
import com.demo.service.wenlei.MemberBankcardsServices;
@Controller
@RequestMapping("/sysmember")
public class Controllbc {
	@Autowired
	MemberBankcardsServices     memberBankcardsServices ;
	@RequestMapping("/dahua")
	public String list(Integer page,MemberBankcards memberBankcards,Map<String,Object> map) {
		if(page==null){
			page=1;	
		} 
		
		System.out.println("======");
		Integer size=2;
		Page<MemberBankcards> pageemp=memberBankcardsServices.fenPage(page, size, memberBankcards);
	    map.put("pageemp",pageemp);
		return "/main/vip/dahua";	
	}
	
	
	
	
	@RequestMapping(value="/BankCard/{id}")
	public String listmemberInof( @PathVariable(value="id") Integer id,Map<String,Object> map){
		
	
	   memberBankcardsServices.queryup(2,id);
	   
	  
	   return   "redirect:/sysmember/dahua";
  
}
	
}
