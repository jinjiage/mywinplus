package com.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class BbinInfo {
	//体验金信息
	private Integer id;//id
	private Integer member_id;//会员id
	private Integer amont;//金额
	private Integer status;//状态（0：是）
	private Date create_date;//
	private Date update_date;//
	@Id
	@SequenceGenerator(name="bbin_info",sequenceName="seq_bbin_info",allocationSize=1)
	@GeneratedValue(generator="bbin_info",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public Integer getAmont() {
		return amont;
	}
	public void setAmont(Integer amont) {
		this.amont = amont;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	
	
}
