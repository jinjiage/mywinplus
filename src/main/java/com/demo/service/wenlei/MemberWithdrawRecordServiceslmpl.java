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

import com.demo.dao.wenlei.MemberWithdrawRecordRepository;
import com.demo.model.MemberWithdrawRecord;

@Service
public class MemberWithdrawRecordServiceslmpl implements MemberWithdrawRecordServices {
@Autowired

MemberWithdrawRecordRepository memberWithdrawRecordRepository;
	public Page<MemberWithdrawRecord> fenPage(Integer page, Integer rowsize, final MemberWithdrawRecord MemberWithdraw) {
	      Pageable pageable =new  PageRequest(page-1, rowsize);
	      Specification<MemberWithdrawRecord>  specification=new Specification<MemberWithdrawRecord>() {

			public Predicate toPredicate(Root<MemberWithdrawRecord> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
			
				List<Predicate>  list=new ArrayList<Predicate>();
				if (MemberWithdraw!=null) {
					
					if (MemberWithdraw.getBank_name()!=null&&!MemberWithdraw.getBank_name().equals("")) {
						
						Path  enamepath = root.get("bank_name");
						list.add(builder.like(enamepath, "%"+MemberWithdraw.getBank_name()+"%"));
						
					}
					
				}

				return builder.and(list.toArray( new Predicate[list.size()]));
			}
		};
	      
		
		
		return  memberWithdrawRecordRepository.findAll(specification,pageable);
	}
	
	@Transactional
	public void queryupwit(Integer status, String channel_name, Integer id) {
	
		memberWithdrawRecordRepository.queryupwit(status, channel_name, id);
	}

	
	
	
	
	
}
