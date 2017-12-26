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

import com.demo.dao.wenlei.MemberDepositRecordRepository;
import com.demo.model.MemberDepositRecord;
@Service
public class MemberDepositRecordServiceImpl implements MemberDepositRecordService {
	@Autowired
	MemberDepositRecordRepository memberDepositRecordRepository;
	public Page getDepositRecordsByMemberId(final Integer memberId, Integer page, Integer pageSize) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<MemberDepositRecord> specification = new Specification<MemberDepositRecord>() {	
			public Predicate toPredicate(Root<MemberDepositRecord> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("member").get("id");
				Predicate predicate = cb.equal(path, memberId);
				return predicate;
			}
		};
		
		return memberDepositRecordRepository.findAll(specification, pageable);
	}
	public void addDepositRecord(MemberDepositRecord record) {
		// TODO Auto-generated method stub
		memberDepositRecordRepository.save(record);
	}
	public MemberDepositRecord getOne(String parseInt) {
		// TODO Auto-generated method stub
		return memberDepositRecordRepository.findMemberDepositRecord(parseInt);
	}
	public void updateStustus(MemberDepositRecord memberDepositRecord) {
		// TODO Auto-generated method stub
		memberDepositRecordRepository.save(memberDepositRecord);
	}

}
