package com.demo.service.wenlei;

import org.springframework.data.domain.Page;


import com.demo.model.MemberDepositRecord;


public interface MemberDepositRecordServies {
	public Page<MemberDepositRecord> fenPage(Integer page,Integer rowsize, final MemberDepositRecord memberDepositRecord );
	
	
	public void queryup(Integer status,Integer id);
	
	
	
}
