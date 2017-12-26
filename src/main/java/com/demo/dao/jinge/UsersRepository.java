package com.demo.dao.jinge;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {
	@Query("select u from  Users u where u.user_name = ?1 and u.password = ?2")
	public Users findUsers(String name,String pwd);
	@Modifying
	@Query("update  Users  S   set S.password =?1 where S.user_name=?2")
	public void queryup(String  password,String name);
	@Query("select  count(*)  from  Users u where u.user_name = ?1 ")
	public Integer findUser(String name);
}
