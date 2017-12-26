package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.MemberProfitRecord;

public interface MemberProfitRecordRepository extends JpaRepository<MemberProfitRecord, Integer>,JpaSpecificationExecutor<MemberProfitRecord> {
	@Query("select e from MemberProfitRecord  e where e.member_id =?")
	public List<MemberProfitRecord> getMemberProfitRecord(Integer id) ;

}
