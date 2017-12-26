package com.demo.service.wenlei;

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
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.wenlei.MemberDepositRecordRepository;
import com.demo.model.MemberDepositRecord;


@Service
public class MemberDepositRecordServieslmpl implements MemberDepositRecordServies {

	@Autowired
	MemberDepositRecordRepository  memberDepositRecordRepository ;
	
	
	public Page<MemberDepositRecord> fenPage(Integer page, Integer rowsize, final MemberDepositRecord memberDepositRecord) {
		Pageable pageable =new  PageRequest(page-1, rowsize);
	      Specification<MemberDepositRecord>  specification=new Specification<MemberDepositRecord>() {

			public Predicate toPredicate(Root<MemberDepositRecord> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
			
				List<Predicate>  list=new ArrayList<Predicate>();
				if (memberDepositRecord!=null) {
					
					/*if (MemberDepositRecord.getBank_name()!=null&&!MemberWithdraw.getBank_name().equals("")) {
						
						Path  enamepath = root.get("bank_name");
						list.add(builder.like(enamepath, "%"+MemberWithdraw.getBank_name()+"%"));
						
					}*/
					
				}

				return builder.and(list.toArray( new Predicate[list.size()]));
			}
		};
	      
		
		
		return  memberDepositRecordRepository.findAll(specification,pageable);
	}

	@Transactional
	public void queryup(Integer status, Integer id) {
		
		memberDepositRecordRepository.queryup(status, id);
	}



}
