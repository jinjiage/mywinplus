package com.demo.service.jinge;

import com.demo.model.MemberAccount;

public interface MemberAccountService {

	MemberAccount getMemberAcount(Integer id);

	void updateBalance(MemberAccount memberAccount);

	void saveMemberAccount(MemberAccount massages);



}
