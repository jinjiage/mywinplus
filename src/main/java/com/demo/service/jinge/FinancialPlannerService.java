package com.demo.service.jinge;

import com.demo.model.FinancialPlanner;

public interface FinancialPlannerService {

	FinancialPlanner selectMemberId(Integer id);

	void insertSelective(FinancialPlanner financialPlanner);

}
