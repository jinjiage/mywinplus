package com.demo.service.wenlei;

import java.util.List;

import com.demo.model.UserRoleRelation;
import com.demo.model.Users;



public interface UsersServices {
	public List<Object[]> xt() ;
    public void addUsers(Users users) ;
    public void addUserRoleRelation(UserRoleRelation userRoleRelation) ;
    
    public  Users  toupdateUsers(Integer id) ;
    
    public  UserRoleRelation  toupdateUserRoleRelation(Integer id) ;  
    public  void  updateUsers(Users users) ;
    public  void  updateUserRoleRelation(UserRoleRelation   userRoleRelation ) ;
    public  void  deleteUsers(Integer id) ;
    
    public  void  deleteUserRoleRelation(Integer id) ;
    
    //修改
    public void queryup(String  password,String name);
    
    
    public Integer findUser(String name);
    
}
