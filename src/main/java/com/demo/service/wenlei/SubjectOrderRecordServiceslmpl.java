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

import com.demo.dao.wenlei.SubjectOrderRecordRepository;
import com.demo.model.SubjectOrderRecord;
@Service
public class SubjectOrderRecordServiceslmpl implements SubjectOrderRecordServices {
	@Autowired
	SubjectOrderRecordRepository  subjectOrderRecordRepository ;
	public Page<SubjectOrderRecord> fenPage(Integer page, Integer rowsize, final SubjectOrderRecord subjectOrderRecord) {
		Pageable pageable=new PageRequest(page-1, rowsize);
		
		Specification<SubjectOrderRecord>  specification=new Specification<SubjectOrderRecord>() {

			public Predicate toPredicate(Root<SubjectOrderRecord> root, CriteriaQuery<?> query, CriteriaBuilder builder) {

				List<Predicate> list=new ArrayList<Predicate>();
				if (subjectOrderRecord!=null) 
					{
					if (subjectOrderRecord.getSerial_number()!=null&&!subjectOrderRecord.getSerial_number().equals("")) {
						Path  enamepath = root.get("serial_number");
						list.add(builder.like(enamepath, "%"+subjectOrderRecord.getSerial_number()+"%"));
						
					}
					
					}
					return builder.and(list.toArray(new Predicate[list.size()]));
				
			}
			
		};
		
		
		return  subjectOrderRecordRepository.findAll(specification, pageable);
	}
	

}










