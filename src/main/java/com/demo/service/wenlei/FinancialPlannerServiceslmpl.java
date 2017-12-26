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

import com.demo.dao.wenlei.FinancialPlannerRepository;
import com.demo.model.FinancialPlanner;

@Service
public class FinancialPlannerServiceslmpl implements FinancialPlannerServices{
@Autowired
FinancialPlannerRepository financialPlannerServices;
	public Page<FinancialPlanner> fenPage(Integer page, Integer rowsize, final FinancialPlanner financialPlanner,final String  Phone) {
		
	Pageable pageable=new PageRequest(page-1, rowsize);
	Specification<FinancialPlanner>  specification=new Specification<FinancialPlanner>() {

		public Predicate toPredicate(Root<FinancialPlanner> root, CriteriaQuery<?> query,
				CriteriaBuilder builder) {
				List<Predicate> list=new ArrayList<Predicate>();
			
			if (financialPlanner!=null) {
				if (financialPlanner.getName()!=null&&!financialPlanner.getName().equals("")) {
					Path  enamepath=root.get("name");
					list.add(builder.like(enamepath,"%"+financialPlanner.getName()+"%"));
				}
				
			if ( Phone!=null&&! Phone.equals("")) {
				   Path mobile_Phone = (Path) root.get("member").get("mobile_Phone");
					list.add(builder.equal(mobile_Phone,Phone));

				}
				
				if (financialPlanner.getStatus()!=null&&!financialPlanner.getStatus().equals("")) {
					   Path status = (Path) root.get("status");
						list.add(builder.equal(status,financialPlanner.getStatus()));

					}
				
				
			}

			return builder.and(list.toArray(new  Predicate[list.size()]));
		}
	};

		return financialPlannerServices.findAll(specification, pageable);
	}

	@Transactional
	public void queryup(Integer status, Integer id) {
		financialPlannerServices.queryup(status, id);
	
	}

}
