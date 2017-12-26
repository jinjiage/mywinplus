package com.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * 角色权限表
 * @author Administrator
 *
 */
@Entity
public class RolePermissionRelation {

	private Integer id;//角色id
	private String permission_ename;//权限名称
	private Date create_date;//创建时间
	@Id
	@SequenceGenerator(name="role_permission_relation",sequenceName="seq_role_permission_relation",allocationSize=1)
	@GeneratedValue(generator="role_permission_relation",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPermission_ename() {
		return permission_ename;
	}
	public void setPermission_ename(String permission_ename) {
		this.permission_ename = permission_ename;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
