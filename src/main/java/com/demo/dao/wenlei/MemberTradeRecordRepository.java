package com.demo.dao.wenlei;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.demo.model.MemberTradeRecord;

public interface MemberTradeRecordRepository extends  JpaRepository<MemberTradeRecord,Integer>,JpaSpecificationExecutor<MemberTradeRecord> {

	@Query("select e from MemberTradeRecord e where e.member_id=:member_id")
	public List<MemberTradeRecord> testqueryMemberTradeRecord(@Param("member_id")Integer member_id);
	@Query("select e from MemberTradeRecord e where e.trade_no =?")
	public MemberTradeRecord findMemberTradeRecord(String tradeNo);
	
	
}
