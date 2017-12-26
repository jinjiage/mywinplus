package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.Subject;

public interface SubjectSysService {
	 public List<Object[]> getSubject(Integer pageNum, Integer pageSize, Subject subject);
	 public Integer getSubjectCount(Subject subject);
	 public void addSubject(Subject subject);
	public Subject findSubjectById(Integer id);
	public void updateSubject(Subject subject);

}
