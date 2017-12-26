package com.demo.dao.jinge;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.demo.model.Subject;

public interface SubjectDao {
	public List<Object[]> findIndexList();
	public List<Object[]>  getPagePayment(Integer pageNum, Integer pageSize, Subject subject);
	public Integer getSubjectCount(Subject subject);
	
	public List<Object[]> find(Integer pageNum, Integer pageSize,Map<String, Object> map);
	
	public Integer  SubjectCount(Map<String, Object> map);
	
	public List<Object[]> jingli(Integer pageNum, Integer pageSize,Map<String, Object> map);
	
	public List<Object[]> yongjingren(Integer id);
	
	
	public List<Object[]> tiyanfuxi(Integer id);

	public List<Object[]> tiyanfuxi(Integer id ,Integer fid);
	public List<Object[]> xt();
	public List<Object[]> findList();
	
}
