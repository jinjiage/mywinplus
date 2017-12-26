package com.demo.controller.wenlei;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.service.wenlei.MemberAccountServices;
import com.demo.service.wenlei.MemberServices;
import com.demo.service.wenlei.SubjectServices;
@Controller
@RequestMapping("/sysmember")
public class Controlleryj {
	@Autowired

	MemberAccountServices memberAccountServices;
	@Autowired
	MemberServices memberServices;
	@Autowired
	SubjectServices  subjectServices;
	
	
	@RequestMapping("/inviteRewards")
	public String list(Integer page,MemberAccount memberAccount,Map<String,Object> map) {
		Integer pageSize=2;
		
		List<Object[]> sub =memberAccountServices.jingli(page, pageSize, map);
		  map.put("sub",sub);
		
		return  "/main/vip/inviteRewards";	
	}
	
	
	
	@RequestMapping("/inviteRewardsRecord")
	public String list1( Integer eid , Integer id , Map<String,Object> map) {
      
		  Member  member=memberServices.jingli(eid);
	      map.put("member", member);  
	      List<Object[]>  list=subjectServices.yongjingren(eid);
	     /* List<Member>  me=memberServices.selectlist();*/
	   /*   map.put("me", me);*/
		/*   memberAccountServices.queryupdatece(lei, id);
		   memberAccountServices.queryupdatetz(wen, id); 
		   memberAccountServices.queryupdate(momey, id);
		   ,  double    momey Integer  lei  , Integer  wen,
		   */  
	      map.put("list", list);
		  return "/main/vip/inviteRewardsRecord";	
	}
	@RequestMapping("/invite")
	public String list2( Integer id ,double momy ) {
		System.out.println(momy);
        memberAccountServices.queryupdate(momy, id);
		return "redirect:/sysmember/inviteRewards";	
	}
	
	
}
