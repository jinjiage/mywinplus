package com.demo.service.jinge;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.BbinPurchaseRecordRepository;
import com.demo.model.BbinPurchaseRecord;

@Service
public class BbinPurchaseRecordServiceImpl implements BbinPurchaseRecordService {
	@Autowired
	BbinPurchaseRecordRepository bbinPurchaseRecordRepository;
	public Object[] getBbinPurchase(Integer id) {
		// TODO Auto-generated method stub
		return bbinPurchaseRecordRepository.getBbinPurchaseRecord(id);
	}
	public void save(BbinPurchaseRecord bbinPurchaseRecord) {
		// TODO Auto-generated method stub
		bbinPurchaseRecordRepository.save(bbinPurchaseRecord);
	}

}
