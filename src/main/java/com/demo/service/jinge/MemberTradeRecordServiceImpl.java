package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.wenlei.MemberTradeRecordRepository;
import com.demo.model.MemberTradeRecord;

@Service
public class MemberTradeRecordServiceImpl implements MemberTradeRecordService {
	@Autowired
	MemberTradeRecordRepository memberTradeRecordRepository;
	public void save(MemberTradeRecord me) {
		// TODO Auto-generated method stub
		memberTradeRecordRepository.save(me);
	}
	public MemberTradeRecord getTradeRecordByTradeNo(String tradeNo) {
		// TODO Auto-generated method stub
		return memberTradeRecordRepository.findMemberTradeRecord(tradeNo);
	}
	public void updateMemberTradeRecord(MemberTradeRecord tradeInfo) {
		// TODO Auto-generated method stub
		memberTradeRecordRepository.save(tradeInfo);
	}

}
