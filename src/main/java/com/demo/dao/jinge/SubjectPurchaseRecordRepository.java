package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.SubjectPurchaseRecord;

public interface SubjectPurchaseRecordRepository extends JpaRepository<SubjectPurchaseRecord, Integer>,JpaSpecificationExecutor<SubjectPurchaseRecord> {
	
}
