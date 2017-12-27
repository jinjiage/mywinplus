package com.demo.service.jinge;

import java.util.List;

import com.demo.model.BbinPurchaseRecord;

public interface BbinPurchaseRecordService {

	Object[] getBbinPurchase(Integer id);

	void save(BbinPurchaseRecord bbinPurchaseRecord);

}
