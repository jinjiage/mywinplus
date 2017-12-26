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

import com.demo.dao.wenlei.MemberBankcardsRepository;
import com.demo.model.MemberBankcards;

@Service

public class MemberBankcardsServiceslmpl implements MemberBankcardsServices {

	@Autowired
	MemberBankcardsRepository  memberBankcardsRepository;
	
	public Page<MemberBankcards> fenPage(Integer page, Integer rowsize, final MemberBankcards memberBankcards) {
		
		Pageable pageable=new PageRequest(page-1, rowsize);
		
		Specification<MemberBankcards>  specification=new Specification<MemberBankcards>() {

			public Predicate toPredicate(Root<MemberBankcards> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
					List<Predicate> list=new ArrayList<Predicate>();
				if (memberBankcards!=null) {
					/*if (memberBankcards.getMember().getMember_name()!=null&&!memberBankcards.getMember().getMember_name().equals("")) {
						Path  enamepath=root.get("member.id").get("member_name");
						list.add(builder.like(enamepath, "%"+memberBankcards.getMember().getMember_name()+"%"));
	
					}*/
		
				}

				return builder.and(list.toArray(new  Predicate[list.size()]));
			}
		};

			return memberBankcardsRepository.findAll(specification, pageable);
	}

	@Transactional
	public void queryup(Integer delflag, Integer id) {
		
		memberBankcardsRepository.queryup(delflag, id);
	}

}
