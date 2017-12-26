package com.demo.dao.jinge;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class BbinPurchaseRecordRepositoryImpl implements BbinPurchaseRecordDao {
	
	@PersistenceContext
	EntityManager entityManager;
	public Object[] getBbinPurchaseRecord(Integer id) {
		String sql = "select s.name,r.amount,s.period,s.year_rate,r.create_date,"
				+ "s.period+r.create_date,r.interest,r.ispayment,aaa.sum_am from "
				+ "bbin_purchase_record r ,(select purchase_id, sum(amount) sum_am "
				+ "from member_profit_record group by purchase_id)aaa,subject s where"
				+ " r.subject_id =aaa.purchase_id and s.id =r.subject_id and r.member_id="+id;
		return (Object[]) entityManager.createNativeQuery(sql).getSingleResult();
	}

}
