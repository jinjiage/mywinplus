package com.demo.service.wenlei;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.jinge.SubjectRepository;
import com.demo.dao.jinge.UsersRepository;
import com.demo.dao.wenlei.UserRoleRelationRepository;
import com.demo.model.UserRoleRelation;
import com.demo.model.Users;

@Service
public class UsersServiceslmpl implements UsersServices {
	@Autowired
	SubjectRepository subjectRepository;
	@Autowired
	
	UsersRepository  usersRepository;
	
	@Autowired
	UserRoleRelationRepository userRoleRelationRepository;
	public List<Object[]> xt() {
		return subjectRepository.xt();
	}
	public void addUsers(Users users) {
		usersRepository.save(users);
		
		
	}
	public void addUserRoleRelation(UserRoleRelation userRoleRelation) {
		userRoleRelationRepository.save(userRoleRelation);
		
	}
	public Users toupdateUsers(Integer id) {
		
		return usersRepository.findOne(id);
	}
	public UserRoleRelation toupdateUserRoleRelation(Integer id) {
	
		return userRoleRelationRepository.findOne(id);
	}
	public void updateUsers(Users users) {
		
		usersRepository.save(users);
	}
	public void updateUserRoleRelation(UserRoleRelation userRoleRelation) {
		userRoleRelationRepository.save(userRoleRelation);
		
	}
	public void deleteUsers(Integer id) {
		usersRepository.delete(id);
		
	}
	public void deleteUserRoleRelation(Integer id) {
		
		userRoleRelationRepository.delete(id);
	}
	@Transactional
	public void queryup(String password, String name) {
		usersRepository.queryup(password, name);
	}
	public Integer findUser(String name) {
	
		return usersRepository.findUser(name);
	}

}
