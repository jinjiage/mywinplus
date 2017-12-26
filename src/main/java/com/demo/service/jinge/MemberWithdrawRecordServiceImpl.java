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

import com.demo.dao.wenlei.MemberWithdrawRecordRepository;
import com.demo.model.FinanceProductSubscribe;
import com.demo.model.Member;
import com.demo.model.MemberWithdrawRecord;

@Service
public class MemberWithdrawRecordServiceImpl implements MemberWithdrawRecordService {
	@Autowired
	MemberWithdrawRecordRepository memberWithdrawRecordRepository;
	public Page getWithdrawRecordsByMemberId(final Integer memberId, Integer page, Integer pageSize) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<MemberWithdrawRecord> specification = new Specification<MemberWithdrawRecord>() {
			
			public Predicate toPredicate(Root<MemberWithdrawRecord> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("member").get("id");
				Predicate predicate = cb.equal(path, memberId);
				return predicate;
			}
		};
		
		return memberWithdrawRecordRepository.findAll(specification, pageable);
	}
	public void addMemberWithdrow(MemberWithdrawRecord record) {
		// TODO Auto-generated method stub
		memberWithdrawRecordRepository.save(record);
	}

}
