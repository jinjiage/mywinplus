package com.demo.service.jinge;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.SubjectPurchaseRecordRepository;
import com.demo.model.Member;
import com.demo.model.SubjectPurchaseRecord;
@Service
public class SubjectPurchaseRecordServiceImpl implements SubjectPurchaseRecordService {
	@Autowired
	SubjectPurchaseRecordRepository subjectPurchaseRecordRepository;

	public Page getPurchaseRecord(final Integer subjcetId, Integer page, Integer pageSize) {

		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<SubjectPurchaseRecord> specification = new Specification<SubjectPurchaseRecord>() {
			
			public Predicate toPredicate(Root<SubjectPurchaseRecord> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("member_id");
				Predicate predicate = cb.equal(path, subjcetId);
				return predicate;
			}
		};
		
		return subjectPurchaseRecordRepository.findAll(specification, pageable);
	}

	public void save(SubjectPurchaseRecord subjectPurchaseRecord) {
		// TODO Auto-generated method stub
		subjectPurchaseRecordRepository.save(subjectPurchaseRecord);
	}


}
