package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Integer>,SubjectDao ,JpaSpecificationExecutor<Subject>{
	@Query("from Subject s where s.id=?")
	public Subject findSubjectById(Integer id);

	

}
