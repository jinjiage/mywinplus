package com.demo.service.wenlei;

import org.springframework.data.domain.Page;

import com.demo.model.MemberWithdrawRecord;


public interface MemberWithdrawRecordServices {

	public Page<MemberWithdrawRecord> fenPage(Integer page,Integer rowsize, final MemberWithdrawRecord memberWithdraw );
	public void queryupwit(    Integer status,  String  channel_name ,  Integer id);
}
