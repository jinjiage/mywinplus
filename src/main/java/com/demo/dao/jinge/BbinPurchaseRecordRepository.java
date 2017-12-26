package com.demo.dao.jinge;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.demo.model.BbinPurchaseRecord;

public interface BbinPurchaseRecordRepository extends JpaRepository<BbinPurchaseRecord, Integer> ,JpaSpecificationExecutor<BbinPurchaseRecord>,BbinPurchaseRecordDao{

}
