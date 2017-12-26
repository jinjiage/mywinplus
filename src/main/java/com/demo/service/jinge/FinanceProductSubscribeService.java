package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.FinanceProductSubscribe;

public interface FinanceProductSubscribeService {

	Page getPageFinanceProductSubscribe(Integer page, Integer pageSize, Integer financeProductFundsId);

	List<Object[]> getCount();

	FinanceProductSubscribe selectByPrimaryKey(Integer id);

	void saveFinance(FinanceProductSubscribe financeProductSubscribe);

	List<FinanceProductSubscribe> findProductSubscribe(Integer id);

	Page<FinanceProductSubscribe> getPageFinanceProductSubscribeByMemberId(Integer page, Integer pageSize, Integer memberId);

}
