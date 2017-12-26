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
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.OverseaConfigRepository;
import com.demo.model.FinanceProductFunds;
import com.demo.model.OverseaConfig;
import com.demo.model.OverseaConfigSubscribe;
@Service
public class OverseaConfigServiceImpl implements OverseaConfigService{
	@Autowired
	OverseaConfigRepository  overseaConfigRepository;
	public List<OverseaConfig> findOverseaConfigList() {
		// TODO Auto-generated method stub
		return overseaConfigRepository.findAll();
	}
	public Page getOverseaConfigList(Integer page, Integer pageSize) {
		Order order = new Order(Direction.DESC, "addtime");
		Sort sort = new Sort(order);
		Pageable pageable = new PageRequest(page-1, pageSize,sort);	
		return overseaConfigRepository.findAll( pageable);
	}
	public void saveOver(OverseaConfig overseaConfig) {
		// TODO Auto-generated method stub
		overseaConfigRepository.save(overseaConfig);
	}
	public OverseaConfig getOne(Integer id) {
		// TODO Auto-generated method stub
		return overseaConfigRepository.findOne(id);
	}
	public Page getOverseaConfigListAPI(final int i, Integer page, Integer pageSize) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<OverseaConfig> specification = new Specification<OverseaConfig>() {	
			public Predicate toPredicate(Root<OverseaConfig> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("status");
				Predicate predicate = cb.notEqual(path, i);
				return predicate;
			}
		};
		
		return overseaConfigRepository.findAll(specification, pageable);
	}
	

}
