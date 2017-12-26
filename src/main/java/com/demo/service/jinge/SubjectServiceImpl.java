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

import com.demo.dao.jinge.SubjectRepository;
import com.demo.model.FinanceProductFunds;
import com.demo.model.Subject;


@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	SubjectRepository subjectRepository;
	public List<Subject> findSubjectList() {
		// TODO Auto-generated method stub
		return subjectRepository.findAll();
	}
	public Page serachByPage(Integer page, Integer pageSize,final Subject subject) {
		Pageable pageable=new PageRequest(page-1, pageSize);
		Specification<Subject> specification=new Specification<Subject>() {
			public Predicate toPredicate(Root<Subject> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> list=new ArrayList<Predicate>();
				Path  typepath = root.get("type");
				Path  yearpath = root.get("year_rate");
				Path  periodpath = root.get("period");
				Path  statuspath = root.get("status");
					if (subject.getType()!=-1) {
						list.add(builder.equal(typepath,subject.getType()));
					}
					if(subject.getYear_rate()!=-1.0){
						if(subject.getYear_rate()==2.0){
							list.add(builder.equal(yearpath,7.5));
						}else if(subject.getYear_rate()<9){
							list.add(builder.equal(yearpath,subject.getYear_rate()));
						}else{
							list.add(builder.ge(yearpath, 8));
						}
					}
						if(subject.getStatus()!=-1){
						list.add(builder.equal(statuspath, subject.getStatus()));
						}
						if(subject.getPeriod()!=-1){
							List<Predicate> predicate=new ArrayList<Predicate>();
							if(subject.getPeriod()==10){
								list.add(builder.le(periodpath,15));
							}else if(subject.getPeriod()==20){
								predicate.add(builder.le(periodpath,30));
								predicate.add(builder.ge(periodpath,15));
								list.addAll(predicate);
							}else if(subject.getPeriod()==100){
								predicate.add(builder.le(periodpath,180));
								predicate.add(builder.ge(periodpath,30));
								list.addAll(predicate);
							}else if(subject.getPeriod()==200){
								predicate.add(builder.le(periodpath,365));
								predicate.add(builder.ge(periodpath,180));
								list.addAll(predicate);
							}else if(subject.getPeriod()==400){

								list.add(builder.ge(periodpath,365));
								
							}
							
						}
					

				
				return builder.and(list.toArray(new Predicate[list.size()]));
			}
		};

		return subjectRepository.findAll(specification, pageable);

	}
	public List<Object[]> selectList() {
		// TODO Auto-generated method stub
		return subjectRepository.findList();
	}
	public Subject getSubject(Integer id) {
		// TODO Auto-generated method stub
		return subjectRepository.findOne(id);
	}
	public void save(Subject subject) {
		// TODO Auto-generated method stub
		subjectRepository.save(subject);
	}




}
