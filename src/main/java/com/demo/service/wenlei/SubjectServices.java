package com.demo.service.wenlei;

import java.util.List;
import java.util.Map;

import com.demo.model.Subject;

public interface SubjectServices {
	public List<Object[]> find(Integer pageNum, Integer pageSize,Map<String, Object> map);
	public Integer SubjectCount(Map<String, Object> map);
	public List<Object[]> yongjingren(Integer id);
	
	public List<Object[]> tiyanfuxi(Integer id) ;

	/*public Subject name(Integer id) ;*/
	
	
	
	
}
