package com.demo.service.jinge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.SubjectPurchaseRecordRepository;
import com.demo.dao.jinge.SubjectRepository;
import com.demo.model.Subject;
@Service
public class SubjectSysServiceImpl implements SubjectSysService {
	@Autowired
	SubjectRepository subjectRepository;
	public List<Object[]> getSubject(Integer pageNum, Integer pageSize, Subject subject) {
		
		return subjectRepository.getPagePayment(pageNum, pageSize, subject);
	}
	public Integer getSubjectCount(Subject subject) {
		// TODO Auto-generated method stub
		return subjectRepository.getSubjectCount(subject);
	}
	public void addSubject(Subject subject) {
		// TODO Auto-generated method stub
		subjectRepository.save(subject);
	}
	public Subject findSubjectById(Integer id) {
	
		return subjectRepository.findSubjectById(id);
	}
	public void updateSubject(Subject subject) {
		// TODO Auto-generated method stub
		subjectRepository.save(subject);
	}
	

}
