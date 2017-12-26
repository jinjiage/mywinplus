package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.wenlei.MemberAccountRepository;
import com.demo.model.MemberAccount;
@Service
public class MemberAccountServiceImpl implements MemberAccountService {
	@Autowired
	MemberAccountRepository memberAccountRepository;
	public MemberAccount getMemberAcount(Integer id) {
		// TODO Auto-generated method stub
		return  memberAccountRepository.getOneMemberAccount(id);
	}
	public void updateBalance(MemberAccount memberAccount) {
		// TODO Auto-generated method stub
		memberAccountRepository.save(memberAccount);
	}
	public void saveMemberAccount(MemberAccount massages) {
		// TODO Auto-generated method stub
		memberAccountRepository.save(massages);
	}
	

}
