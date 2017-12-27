package com.demo.service.jinge;

import java.util.Set;

import com.demo.model.Users;

public interface UsersService {
	 public Users findUser(String name,String pwd);

	public Users findUsers(String username);

	public Set<String> findRoles(String string);
}
