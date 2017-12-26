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

import com.demo.dao.jinge.OverseaConfigSubscribeRepository;
import com.demo.model.OverseaConfigSubscribe;
import com.demo.model.SubjectPurchaseRecord;
@Service
public class OverseaConfigSubscribeServiceImpl implements OverseaConfigSubscribeService {
	@Autowired
	OverseaConfigSubscribeRepository overseaConfigSubscribeRepository;
	public Page getPageSubscribe( Integer page, Integer pageSize,final Integer id) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<OverseaConfigSubscribe> specification = new Specification<OverseaConfigSubscribe>() {	
			public Predicate toPredicate(Root<OverseaConfigSubscribe> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("oversea_id");
				Predicate predicate = cb.equal(path, id);
				return predicate;
			}
		};
		
		return overseaConfigSubscribeRepository.findAll(specification, pageable);
	}
	public void save(OverseaConfigSubscribe overseaConfigSubscribe) {
		// TODO Auto-generated method stub
		overseaConfigSubscribeRepository.save(overseaConfigSubscribe);
	}

}
