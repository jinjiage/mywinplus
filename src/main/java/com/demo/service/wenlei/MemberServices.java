package com.demo.service.wenlei;

import java.util.List;

import org.springframework.data.domain.Page;


import com.demo.model.FinancialPlanner;
import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberDepositRecord;
import com.demo.model.MemberTradeRecord;
import com.demo.model.MemberWithdrawRecord;


public interface MemberServices {
	public Page<Member> fenPage(Integer page,Integer rowsize, final Member member );
	public List<Member> selectlist();
	//锟剿猴拷锟斤拷息
	public  Member  selectname(Integer  id) ;
	//锟绞斤拷锟斤拷息
  /*public List<MemberAccount> selectname1(Integer  id) ;*/
	//锟斤拷锟斤拷锟较�
	public  FinancialPlanner  selectname2(Integer  id) ;
	//锟矫伙拷锟斤拷
	public    MemberWithdrawRecord selectname3(Integer  id) ;
	//锟矫伙拷钱锟斤拷锟斤拷息
	public List<MemberTradeRecord> testqueryMemberTradeRecord(Integer member_id);
	public List<MemberWithdrawRecord> MemberWithdrawRecord(Integer member_id);
	public List<MemberDepositRecord> testqueryMemberDepositRecord(Integer member_id);
	public  Member  jingli(Integer  id) ;
	
	
	
	


}
