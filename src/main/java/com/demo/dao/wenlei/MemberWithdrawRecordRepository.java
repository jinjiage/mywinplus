package com.demo.dao.wenlei;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.demo.model.MemberWithdrawRecord;

public interface MemberWithdrawRecordRepository extends  JpaRepository< MemberWithdrawRecord,Integer>,JpaSpecificationExecutor< MemberWithdrawRecord> {

	@Query("select e from MemberWithdrawRecord e where e.member.id=:member_id")
	public List<MemberWithdrawRecord> MemberWithdrawRecord(@Param("member_id")Integer member_id);
	
	
	@Modifying
	@Query("update MemberWithdrawRecord   S   set S.status =?1 ,S.channel_name=?2    where S.member.id=?3")
	public void queryupwit(    Integer status,  String  channel_name ,  Integer id);

}
