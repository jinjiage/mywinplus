package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.wenlei.FinancialPlannerRepository;
import com.demo.model.FinancialPlanner;

@Service
public class FinancialPlannerServiceImpl implements FinancialPlannerService {
	@Autowired
	FinancialPlannerRepository financialPlannerRepository;
	public FinancialPlanner selectMemberId(Integer id) {
		// TODO Auto-generated method stub
		return financialPlannerRepository.getOne(id);
	}
	public void insertSelective(FinancialPlanner financialPlanner) {
		// TODO Auto-generated method stub
		financialPlannerRepository.save(financialPlanner);
	}

}
