package com.demo.dao.wenlei;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.FinancialPlanner;



public interface FinancialPlannerRepository extends  JpaRepository<FinancialPlanner,Integer>,JpaSpecificationExecutor<FinancialPlanner>{
	@Modifying
	@Query("update FinancialPlanner  S   set S.status =?1 where S.id=?2")
	public void queryup(Integer status,Integer id);
	@Query("from FinancialPlanner f where f.member.id=?")
	public FinancialPlanner getOne(Integer id);
}
