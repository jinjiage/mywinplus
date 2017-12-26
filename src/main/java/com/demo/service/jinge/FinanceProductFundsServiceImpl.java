package com.demo.service.jinge;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.ejb.criteria.predicate.InPredicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.jinge.FinanceProductFundsRepository;
import com.demo.model.FinanceProductFunds;
import com.demo.model.Member;
import com.demo.model.SubjectPurchaseRecord;
@Service
public class FinanceProductFundsServiceImpl implements FinanceProductFundsService {
	@Autowired
	FinanceProductFundsRepository financeProductFundsRepository;
	public List<FinanceProductFunds> findFinanceProductFundsList() {
		return financeProductFundsRepository.findAll();
	}
	public Page getfinanceProductFunds(final FinanceProductFunds financeProductFunds, Integer page, Integer pageSize) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		Specification<FinanceProductFunds> specification=new Specification<FinanceProductFunds>() {
			public Predicate toPredicate(Root<FinanceProductFunds> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> list=new ArrayList<Predicate>();
				if (financeProductFunds!=null) 
				{
					if (financeProductFunds.getName()!=null&&!financeProductFunds.getName().equals("")) {
						Path  namepath = root.get("name");
						list.add(builder.like(namepath, "%"+financeProductFunds.getName()+"%"));
					}
					if (financeProductFunds.getStatus()!=null&&financeProductFunds.getStatus()!=-1) {
						Path  statuspath = root.get("status");
						list.add(builder.equal(statuspath, financeProductFunds.getStatus()));
					}
					if (financeProductFunds.getType()!=null&&financeProductFunds.getType()!=-1) {
						Path  typepath = root.get("type");
						list.add(builder.equal(typepath, financeProductFunds.getType()));
					}
				}
				return builder.and(list.toArray(new Predicate[list.size()]));
			}
		};

		return financeProductFundsRepository.findAll(specification, pageable);

	}
	@Transactional
	public void addFinanceProductFunds(FinanceProductFunds financeProductFunds) {
		// TODO Auto-generated method stub
		financeProductFundsRepository.save(financeProductFunds);
	}
	public FinanceProductFunds selectByProductId(int financeProductFundsId) {
		
		return financeProductFundsRepository.findOne(financeProductFundsId);
	}
	public void updateFinanceProductFunds(FinanceProductFunds financeProductFunds) {
		financeProductFundsRepository.save(financeProductFunds);
	}
	public Page getPagingProductsByType(final Integer[] types, Integer page, Integer pageSize) {
		
		Pageable pageable=new PageRequest(page-1, pageSize);
		Specification<FinanceProductFunds> specification=new Specification<FinanceProductFunds>() {
			public Predicate toPredicate(Root<FinanceProductFunds> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> list = new ArrayList();
				 In<Object> in = builder.in(root.get("type"));
				 for (Integer id : types) {
	                    in.value(id);
	                }
				 list.add(in);
				return builder.and(list.toArray(new Predicate[list.size()]));
			}
		};

		return financeProductFundsRepository.findAll(specification, pageable);
	}
	
}
