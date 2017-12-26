package com.demo.controller.wenlei;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.Subject;
import com.demo.service.wenlei.SubjectServices;
@Controller
@RequestMapping("/sysmember")
public class Controllfx {
	@Autowired
	SubjectServices subjectServices;
	@RequestMapping("/payment")
	public String list(Map<String,Object> map1, Integer page , String  name) {
		if (page==null ) {
			page=1;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subject", name);
		
		Integer pageqq=subjectServices.SubjectCount(map);
		 Integer  pageSize=2;
		 
		Integer pageNum =pageqq%pageSize==0?pageqq/pageSize:pageqq/pageSize+1;
		
		List<Object[]> sublist =subjectServices.find( page,  pageSize, map);
		map1.put("sublist", sublist);
		map1.put("pages", pageNum);
		map1.put("page", page);
		return "/main/vip/payment";	
	}
	
	@RequestMapping("/paymentBbinContent/{id}")
	public String list1(@PathVariable(value="id") Integer id , Map<String,Object> map1, Integer page ,Subject subject) {
		List<Object[]> sublist =subjectServices.tiyanfuxi(id);
		
		/*Subject  sub=subjectServices.name(id);*/
		
		map1.put("sub", sublist);
		
	    map1.put("s", sublist.get(0)[0]);
		map1.put("su", sublist.get(0)[1]);
		map1.put("suu", sublist.get(0)[2]);	
	
		return "/main/vip/paymentBbinContent";	
	}
	
	@RequestMapping("/paymentContent")
	public String list2(  Map<String,Object> map1, Integer page ,Subject subject) {
		/*if (page==null ) {
			page=1;
			/{id}
			 * @PathVariable(value="id") Integer id ,
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subject", subject);
		Integer pageqq=subjectServices.SubjectCount(map);
		 Integer  pageSize=2;
		Integer pageNum =pageqq%pageSize==0?pageqq/pageSize:pageqq%pageSize+1;
		List<Object[]> sublist =subjectServices.find( page,  pageSize, map);
		System.out.println(sublist.get(0)[0]);
		map1.put("sublist", sublist);
		map1.put("pages", pageNum);
		map1.put("page", page);*/
		return "/main/vip/paymentContent";	
		
		
		
		
	}

}
