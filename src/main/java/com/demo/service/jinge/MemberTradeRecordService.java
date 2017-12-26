package com.demo.service.jinge;

import com.demo.model.MemberTradeRecord;

public interface MemberTradeRecordService {

	void save(MemberTradeRecord me);

	MemberTradeRecord getTradeRecordByTradeNo(String tradeNo);

	void updateMemberTradeRecord(MemberTradeRecord tradeInfo);

}
