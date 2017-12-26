package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.FinanceProductFunds;
import com.demo.model.FinanceProductSubscribe;

public interface FinanceProductSubscribeRepository extends JpaRepository<FinanceProductSubscribe, Integer> ,JpaSpecificationExecutor<FinanceProductSubscribe> {
	@Query(value="select product_id, count(*) from finance_product_subscribe where status=2 group by product_id ",nativeQuery=true)
	public List<Object[]> getCount();
	@Query("from FinanceProductSubscribe f where f.member_id =?")
	public List<FinanceProductSubscribe> ProductSubscribe(Integer id);

}
