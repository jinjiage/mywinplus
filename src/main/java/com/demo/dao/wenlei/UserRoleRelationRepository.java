package com.demo.dao.wenlei;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.demo.model.UserRoleRelation;

public interface UserRoleRelationRepository extends  JpaRepository<UserRoleRelation,Integer>,JpaSpecificationExecutor<UserRoleRelation>  {

}
