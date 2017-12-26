package com.demo.dao.wenlei;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.model.Member;
import com.demo.model.MemberDepositRecord;
public interface MemberRepository extends  JpaRepository<Member,Integer>,JpaSpecificationExecutor<Member> {
	
	/*@Query("select e from   Member  e where e.member.id=:id")
	public List< Member> testqueryMemberDepositRecord(@Param("id")Integer eid);*/
	
	
	
}
