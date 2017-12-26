package com.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * ��ɫ��
 * @author Administrator
 *
 */
@Entity
public class UserRole {

	private Integer id;//主键
	private String cname;//中文名
	private String ename;//英文名
	private Integer available ;//是否可用
	private String remark;//备注备注
	private Date create_date;//创建时间
	private Date update_date;//修改时间
	private String category;//
	private Integer source_type;//
	private Integer source_id;//
	private Integer del_flag;//
	@Id
	@SequenceGenerator(name="user_role",sequenceName="seq_user_role",allocationSize=1)
	@GeneratedValue(generator="user_role",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getAvailable() {
		return available;
	}
	public void setAvailable(Integer available) {
		this.available = available;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getSource_type() {
		return source_type;
	}
	public void setSource_type(Integer source_type) {
		this.source_type = source_type;
	}
	public Integer getSource_id() {
		return source_id;
	}
	public void setSource_id(Integer source_id) {
		this.source_id = source_id;
	}
	public Integer getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}
	
	
}
