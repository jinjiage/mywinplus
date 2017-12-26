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

import com.demo.dao.jinge.FinanceProductSubscribeRepository;
import com.demo.model.FinanceProductSubscribe;
import com.demo.model.SubjectPurchaseRecord;

@Service
public class FinanceProductSubscribeServiceImpl implements FinanceProductSubscribeService {
	@Autowired
	FinanceProductSubscribeRepository financeProductSubscribeRepository;

	public Page getPageFinanceProductSubscribe(Integer page, Integer pageSize,final Integer financeProductFundsId) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<FinanceProductSubscribe> specification = new Specification<FinanceProductSubscribe>() {
			
			public Predicate toPredicate(Root<FinanceProductSubscribe> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("product_id");
				Predicate predicate = cb.equal(path, financeProductFundsId);
				return predicate;
			}
		};
		
		return financeProductSubscribeRepository.findAll(specification, pageable);
		
	}

	public List<Object[]> getCount() {
		
		return financeProductSubscribeRepository.getCount();
	}

	public FinanceProductSubscribe selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return financeProductSubscribeRepository.findOne(id);
	}

	public void saveFinance(FinanceProductSubscribe financeProductSubscribe) {
		// TODO Auto-generated method stub
		financeProductSubscribeRepository.save(financeProductSubscribe);
	}

	public List<FinanceProductSubscribe> findProductSubscribe(Integer id) {
		// TODO Auto-generated method stub
		return financeProductSubscribeRepository.ProductSubscribe(id);
	}

	public Page<FinanceProductSubscribe> getPageFinanceProductSubscribeByMemberId(Integer page, Integer pageSize,
		final	Integer memberId) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<FinanceProductSubscribe> specification = new Specification<FinanceProductSubscribe>() {
			
			public Predicate toPredicate(Root<FinanceProductSubscribe> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list=new ArrayList<Predicate>();

				Path path = root.get("member_id");
				Path  stautspath = root.get("status");
				list.add(cb.equal(path, memberId));
				list.add(cb.equal(stautspath, 1));
				return cb.and(list.toArray(new Predicate[list.size()]));
			}
		};
		
		return financeProductSubscribeRepository.findAll(specification, pageable);
	}

	
	
}
