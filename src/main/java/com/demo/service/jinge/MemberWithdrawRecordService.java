package com.demo.service.jinge;

import org.springframework.data.domain.Page;

import com.demo.model.Member;
import com.demo.model.MemberWithdrawRecord;

public interface MemberWithdrawRecordService {

	Page getWithdrawRecordsByMemberId(Integer memberId, Integer page, Integer pageSize);

	void addMemberWithdrow(MemberWithdrawRecord record);
	
}
