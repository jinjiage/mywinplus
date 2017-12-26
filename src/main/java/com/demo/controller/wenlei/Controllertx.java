package com.demo.controller.wenlei;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.MemberAccount;
import com.demo.model.MemberWithdrawRecord;
import com.demo.service.wenlei.MemberAccountServices;
import com.demo.service.wenlei.MemberWithdrawRecordServices;
@Controller
@RequestMapping("/sysmember")
public class Controllertx {
	@Autowired
	MemberWithdrawRecordServices memberWithdrawRecordServices;
	@Autowired
	MemberAccountServices   memberAccountServices;
	@RequestMapping("/withdrawManage")
	public String list(Integer page,MemberWithdrawRecord memberWithdrawRecord,Map<String,Object> map) {
	if(page==null){
			page=1;
		} 
		Integer size=2;
		Page<MemberWithdrawRecord> pageemp=memberWithdrawRecordServices.fenPage(page, size,memberWithdrawRecord);
	    map.put("pageemp",pageemp);
		return "/main/vip/WithdrawManage";	
	}
	
	@RequestMapping("/withdrawAudit")
	public String list1(Integer  serialNumber ,String  channelName) {
		
		
		
		
		
		System.out.println(serialNumber);
		System.out.println(channelName);
		memberWithdrawRecordServices.queryupwit(1, channelName, serialNumber);
		return "redirect:/sysmember/withdrawManage";	
	}
	@RequestMapping("/WithdrawUnfreeze/{id}")
	public String list2( @PathVariable(value="id") Integer id ) {
	    MemberAccount   memberAccount= memberAccountServices.getOneMemberAccount(id);
		double useable_balance=memberAccount.getUseable_balance();
		double imuseale_balance=memberAccount.getImuseale_balance() ;
		double  momey=useable_balance+imuseale_balance;
		memberAccountServices.updateMemberAccount(momey, id);
		return "redirect:/sysmember/withdrawManage";	
	}
	
	
	
	
	
}
