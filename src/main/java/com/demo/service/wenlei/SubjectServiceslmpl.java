package com.demo.service.wenlei;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.SubjectRepository;
import com.demo.model.Subject;


@Service
public class SubjectServiceslmpl implements SubjectServices {
@Autowired

SubjectRepository subjectRepository;
	public List<Object[]> find(Integer pageNum, Integer pageSize,Map<String, Object> map) {
		
		return subjectRepository.find(pageNum,  pageSize,map);
	}
	public Integer SubjectCount(Map<String, Object> map) {
		
		return subjectRepository.SubjectCount(map);
	}
	public List<Object[]> yongjingren(Integer id) {
		
		return subjectRepository.yongjingren(id);
	}
	public List<Object[]> tiyanfuxi(Integer id) {
		
		return subjectRepository.tiyanfuxi(id);
	}
/*	public Subject name(Integer id) {
		
		return subjectRepository.findOne(id);
	}
*/
	
	
}
