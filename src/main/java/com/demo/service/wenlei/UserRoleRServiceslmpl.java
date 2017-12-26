package com.demo.service.wenlei;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.demo.dao.wenlei.UserRoleRepository;
import com.demo.model.UserRole;
@Service
public class UserRoleRServiceslmpl implements UserRoleRServices {

	@Autowired
	UserRoleRepository userRoleRepository;
	public List<UserRole> selectlist() {
		return userRoleRepository.findAll();
	}
	
	public Page<UserRole> fenPage(Integer page, Integer rowsize, final UserRole userRole) {
			Pageable pageable=new PageRequest(page-1, rowsize);
			
			Specification<UserRole>  specification=new Specification<UserRole>() {

				public Predicate toPredicate(Root<UserRole> root, CriteriaQuery<?> query,
						CriteriaBuilder builder) {
						List<Predicate> list=new ArrayList<Predicate>();
					if (userRole!=null) {
						
					}
					return builder.and(list.toArray(new  Predicate[list.size()]));
				}
			};

				return userRoleRepository.findAll(specification, pageable);


}

	public void addname(UserRole userRole) {
		
		userRoleRepository.save(userRole);
	}
}
