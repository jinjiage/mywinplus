package com.demo.service.jinge;

import org.springframework.data.domain.Page;

import com.demo.model.MemberDepositRecord;

public interface MemberDepositRecordService {

	Page getDepositRecordsByMemberId(Integer id, Integer page, Integer pageSize);

	void addDepositRecord(MemberDepositRecord record);

	MemberDepositRecord getOne(String parseInt);

	void updateStustus(MemberDepositRecord memberDepositRecord);

}
