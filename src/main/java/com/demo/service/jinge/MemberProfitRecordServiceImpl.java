package com.demo.service.jinge;

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

import com.demo.dao.jinge.MemberProfitRecordRepository;

import com.demo.model.MemberProfitRecord;
@Service
public class MemberProfitRecordServiceImpl implements MemberProfitRecordService {
	@Autowired
	MemberProfitRecordRepository memberProfitRecordRepository;
	public MemberProfitRecord getOne(Integer id) {
		// TODO Auto-generated method stub
		return memberProfitRecordRepository.findOne(id);
	}
	public Page findMemberProfitRecordBymemberId(final Integer MemberId, Integer page, Integer pageSize) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<MemberProfitRecord> specification = new Specification<MemberProfitRecord>() {
			
			public Predicate toPredicate(Root<MemberProfitRecord> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("member_id");
				Predicate predicate = cb.equal(path, MemberId);
				return predicate;
			}
		};
		
		return memberProfitRecordRepository.findAll(specification, pageable);
	}


}
