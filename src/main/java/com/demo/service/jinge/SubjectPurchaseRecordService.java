package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.SubjectPurchaseRecord;

public interface SubjectPurchaseRecordService {

	Page getPurchaseRecord(Integer subjcetId, Integer page, Integer pageSize);

	void save(SubjectPurchaseRecord subjectPurchaseRecord);


	

}
