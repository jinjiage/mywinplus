package com.demo.dao.jinge;

import java.util.Set;

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
	@Query("select u from  Users u where u.user_name = ?")
	public Users findUsers(String username);
	@Query(value="select ename  from users u,user_role r,user_role_relation ur  where  ur.id=u.id   and ur.role_id = r.id and u.user_name =?",nativeQuery=true)
	public Set<String> findRoles(String string);
}
