package com.demo.controller.wenlei;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.MemberDepositRecord;

import com.demo.service.wenlei.MemberDepositRecordServies;
@Controller
@RequestMapping("/sysmember")
public class Controllercz {
	@Autowired
	
	MemberDepositRecordServies memberDepositRecordServies;
	@RequestMapping("/rechargeManage")
	public String list(MemberDepositRecord memberDepositRecord,Integer page,Map<String,Object> map){
		    Integer status=memberDepositRecord.getStatus();
		   Integer id=memberDepositRecord.getId();   
		if (status!=null&&id!=null) {
			memberDepositRecordServies.queryup(status, id);	
		}
        if(page==null){
			page=1;
		} 
		Integer size=2;
		Page<MemberDepositRecord> pageemp=memberDepositRecordServies.fenPage(page, size, memberDepositRecord);
	    map.put("pageemp",pageemp);
		return "/main/vip/rechargeManage";
}
	
	/*  @RequestMapping(value="/recharge")
			public String listmemberInof(MemberDepositRecord  subjectOrderRecord ,Map<String,Object> map){
			 Integer status=subjectOrderRecord.getStatus();
			   Integer id=subjectOrderRecord.getId();   
			   memberServices.queryup(status,id);
		       return "redirect:rechargeManage";
		}
*/
}
