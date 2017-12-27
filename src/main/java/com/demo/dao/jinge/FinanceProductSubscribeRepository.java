package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.FinanceProductFunds;
import com.demo.model.FinanceProductSubscribe;

public interface FinanceProductSubscribeRepository extends JpaRepository<FinanceProductSubscribe, Integer> ,JpaSpecificationExecutor<FinanceProductSubscribe> {
	@Query(value="select f.id,nvl(aaa.counts,0) from  (select product_id id, count(*)counts from finance_product_subscribe where status=2 group by product_id)aaa right join finance_product_funds f on f.id=aaa.id ",nativeQuery=true)
	public List<Object[]> getCount();
	@Query("from FinanceProductSubscribe f where f.member_id =?")
	public List<FinanceProductSubscribe> ProductSubscribe(Integer id);

}
