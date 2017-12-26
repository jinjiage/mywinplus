package com.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
/**
 * �û���ɫ������
 * @author Administrator
 *
 */
@Entity
public class UserRoleRelation {

	private Integer id;//用户id
	private Integer role_id;//角色id
	private Date create_date;//创建时间
	@Id
	@SequenceGenerator(name="user_role_relation",sequenceName="seq_user_role_relation",allocationSize=1)
	@GeneratedValue(generator="user_role_relation",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
