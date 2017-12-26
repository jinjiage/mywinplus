package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.Subject;

public interface SubjectService {


	public List<Subject> findSubjectList();

	public Page serachByPage(Integer page, Integer pageSize, Subject subject);

	public List<Object[]> selectList();

	public Subject getSubject(Integer id);

	public void save(Subject subject);


}
