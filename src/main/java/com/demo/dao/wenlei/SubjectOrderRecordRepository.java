package com.demo.dao.wenlei;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.SubjectOrderRecord;

public interface SubjectOrderRecordRepository  extends  JpaRepository<SubjectOrderRecord,Integer>,JpaSpecificationExecutor<SubjectOrderRecord> {
	
	
	
}
