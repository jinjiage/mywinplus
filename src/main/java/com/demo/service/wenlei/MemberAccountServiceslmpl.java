package com.demo.service.wenlei;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import com.demo.dao.jinge.SubjectRepository;
import com.demo.dao.wenlei.MemberAccountRepository;
import com.demo.model.FinancialPlanner;
import com.demo.model.MemberAccount;

@Service
public class MemberAccountServiceslmpl implements MemberAccountServices{
   /* @Autowired
    SubjectRepository subjectRepository;*/
	   @Autowired
	   SubjectRepository   subjectRepository;
	   @Autowired
	   MemberAccountRepository memberAccountRepository;
/*@Autowired
	MemberAccountRepository  memberAccountRepository ;
	public Page<MemberAccount> fenPage(Integer page, Integer rowsize, final MemberAccount memberAccount) {
		Pageable pageable=new PageRequest(page-1, rowsize);

		Specification<MemberAccount>  specification=new Specification<MemberAccount>() {

			public Predicate toPredicate(Root<MemberAccount> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
					List<Predicate> list=new ArrayList<Predicate>();
				
				if (memberAccount!=null) {
					
					if (memberAccount.get!=null&&!financialPlanner.getName().equals("")) {
						Path  enamepath=root.get("name");
						
						list.add(builder.like(enamepath, "%"+financialPlanner.getName()+"%"));
					}
		
				}

				return builder.and(list.toArray(new  Predicate[list.size()]));
			}
		};

			return memberAccountRepository.findAll(specification, pageable);
		
	}*/

public List<Object[]> jingli(Integer pageNum, Integer pageSize, Map<String, Object> map) {

		return subjectRepository.jingli(pageNum, pageSize, map);
	}
@Transactional
public void queryupdate(double  momey, Integer id) {
	memberAccountRepository.queryupdate(momey, id);
}
public MemberAccount getOneMemberAccount(Integer member_id) {
	
	return memberAccountRepository.findOne(member_id);
}
public void updateMemberAccount(double momey, Integer id) {
	memberAccountRepository.updateMemberAccount(momey, id);
	
}

/*public void queryupdatece(Integer lei, Integer id) {

	memberAccountRepository.queryupdatece(lei, id);
}

public void queryupdatetz(Integer lei, Integer id) {
	memberAccountRepository.queryupdatetz(lei, id);
	
}*/
  
    
    
    
    
	
}
