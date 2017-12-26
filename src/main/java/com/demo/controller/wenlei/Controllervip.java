package com.demo.controller.wenlei;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.demo.model.FinancialPlanner;
import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberDepositRecord;
import com.demo.model.MemberTradeRecord;
import com.demo.model.MemberWithdrawRecord;
import com.demo.service.wenlei.MemberServices;

@Controller
@RequestMapping("/sysmember")
public class Controllervip {

	@Autowired
	MemberServices  memberServices;

	@RequestMapping("/index")
	public String list(Member member,Integer page,Map<String,Object> map){
		if(page==null){
			page=1;
		} 

		Integer size=2;
		Page<Member> pageemp=memberServices.fenPage(page, size, member);
		map.put("member",member);
		map.put("pageemp",pageemp);
		return "/main/vip/index";

	}	

	@RequestMapping("/memberInof/{id}")
	public String listmemberInof(@PathVariable(value="id") Integer id ,Map<String,Object> map){
		Member  meber=memberServices.selectname(id);
		FinancialPlanner  financialPlanner =memberServices.selectname2(id);
		List<MemberTradeRecord>  memberTradeRecord=memberServices.testqueryMemberTradeRecord(id);
		List<MemberDepositRecord> memberDepositRecord=memberServices.testqueryMemberDepositRecord(id);
		List<MemberWithdrawRecord>  memberWithdrawRecord=memberServices.MemberWithdrawRecord(id);
	/*	List<MemberAccount> memberAccount =memberServices.selectname1(id);*/
		map.put("meber",meber);
	/*	map.put("memberAccount",memberAccount.get(0));*/
		map.put("financialPlanner",financialPlanner); 
		map.put("memberTradeRecord",memberTradeRecord); 
		map.put("memberDepositRecord",memberDepositRecord); 
		map.put("memberWithdrawRecord",memberWithdrawRecord);
		return "/main/vip/memberInof";
	}

}
