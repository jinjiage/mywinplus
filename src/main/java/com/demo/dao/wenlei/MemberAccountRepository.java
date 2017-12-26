package com.demo.dao.wenlei;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.model.MemberAccount;


public interface MemberAccountRepository  extends  JpaRepository<MemberAccount,Integer>,JpaSpecificationExecutor<MemberAccount> {


	@Query("select e from MemberAccount e where e.member.id=:member_id")
	 public List<MemberAccount>   upMemberAccount(@Param("member_id")Integer member_id);
	
	@Query("select e from MemberAccount e where e.member.id=:member_id")
	public MemberAccount  getOneMemberAccount(@Param("member_id")Integer member_id);

	@Modifying
	@Query("update MemberAccount  S   set S.useable_balance=?1 where S.member.id=?2")
	public void updateMemberAccount(double momey ,Integer id);
	
	
	
	
	@Modifying
	@Query("update MemberAccount  S   set S.useable_balance=?1 where S.member.id=?2")
	public void queryupdate(double momey ,Integer id);
/*	@Modifying
	@Query("update AwardRecords  S   set S.type =?1 where S.id=?2")
	public void queryupdatece(Integer lei ,Integer id);
	@Modifying
	@Query("update AwardRecords  S   set S.isAward =?1 where S.id=?2")
	public void queryupdatetz(Integer lei ,Integer id);*/
	
	
}
