package com.demo.service.jinge;

import com.demo.model.MemberBankcards;

public interface MemberBankCardService {

	MemberBankcards getCard(Integer id, Integer delflag);

	MemberBankcards selectCard(String bankCard);

	void addBankCard(MemberBankcards cardInfo);

	

}
