package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.wenlei.MemberBankcardsRepository;
import com.demo.model.MemberBankcards;
@Service
public class MemberBankCardServiceImpl implements MemberBankCardService {
	@Autowired
	MemberBankcardsRepository memberBankcardsRepository;
	public MemberBankcards getCard(Integer id, Integer delflag) {
		// TODO Auto-generated method stub
		return memberBankcardsRepository.getMemberBankcards(id,delflag);
	}
	public MemberBankcards selectCard(String bankCard) {
		// TODO Auto-generated method stub
		return memberBankcardsRepository.getOneMember(bankCard);
	}
	public void addBankCard(MemberBankcards cardInfo) {
		// TODO Auto-generated method stub
		memberBankcardsRepository.save(cardInfo);
	}

}
