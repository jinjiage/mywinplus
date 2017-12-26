package com.demo.dao.wenlei;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.model.MemberDepositRecord;
public interface MemberDepositRecordRepository  extends  JpaRepository<MemberDepositRecord,Integer>,JpaSpecificationExecutor<MemberDepositRecord>{

	@Query("select e from  MemberDepositRecord  e where e.member.id=:id")
	public List<MemberDepositRecord> testqueryMemberDepositRecord(@Param("id")Integer eid);
	@Modifying
	@Query("update MemberDepositRecord  S   set S.status =?1 where S.id=?2")
	public void queryup(Integer status,Integer id);
	@Query(" from MemberDepositRecord e where e.serial_number =?")
	public MemberDepositRecord findMemberDepositRecord(String parseInt);
}
