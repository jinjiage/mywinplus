package com.demo.service.wenlei;

import org.springframework.data.domain.Page;
import com.demo.model.FinancialPlanner;
public interface FinancialPlannerServices {
	public Page<FinancialPlanner> fenPage(Integer page,Integer rowsize, final FinancialPlanner financialPlanner ,String  Phone );
	
	public void queryup(Integer status,Integer id);
	
	
	
}
