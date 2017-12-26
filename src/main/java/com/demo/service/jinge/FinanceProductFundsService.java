package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.FinanceProductFunds;

public interface FinanceProductFundsService {


	public Page getfinanceProductFunds(FinanceProductFunds financeProductFunds, Integer page, Integer pageSize);

	public void addFinanceProductFunds(FinanceProductFunds financeProductFunds);

	public FinanceProductFunds selectByProductId(int financeProductFundsId);

	public void updateFinanceProductFunds(FinanceProductFunds financeProductFunds);

	public List<FinanceProductFunds> findFinanceProductFundsList();

	public Page getPagingProductsByType(Integer[] types, Integer page, Integer pageSize);

	

}
