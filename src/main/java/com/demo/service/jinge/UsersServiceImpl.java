package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.UsersRepository;
import com.demo.model.Users;
@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	UsersRepository usersRepository;
	public Users findUser(String name, String pwd) {
	
		return usersRepository.findUsers(name, pwd);
	}
	

}
