package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.MemberOneRepository;
import com.demo.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberOneRepository memberRepository;

	public Member selectByPrimaryKey(Integer member_id) {
		// TODO Auto-generated method stub
		return memberRepository.findOne(member_id);
	}

	public Integer selectOneMember(String string) {
		// TODO Auto-generated method stub
		return memberRepository.findOne(string);
	}

	public void saveMember(Member member) {
		// TODO Auto-generated method stub
		memberRepository.save(member);
	}

	public Integer selectMemberByName(String string) {
		// TODO Auto-generated method stub
		return memberRepository.findByName(string);
	}

	public Member selectLogin(String mobile_Phone, String password) {
		// TODO Auto-generated method stub
		return memberRepository.findMember(mobile_Phone,password);
	}

	public Member selectMemberByPhone(String mobile_Phone) {
		// TODO Auto-generated method stub
		return memberRepository.findMemberByPhone(mobile_Phone);
	}
	
}
