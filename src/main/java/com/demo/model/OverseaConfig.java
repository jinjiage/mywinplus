package com.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class OverseaConfig {

	private Integer id;//id
	private String title;//标题
	private String content;//内容
	private Integer sortcolum;//排序值
	private String child_title;//子标题
	private String description;//描述
	private String user_type;//用户群体
	private Date updtime;//修改时间
	private Date addtime;//添加时间
	private String oversea_icon;//图标
	private Date start_date;//开始时间
	private Date end_date;//结束时间
	private Integer status;//状态״̬
	@Id
	@SequenceGenerator(name="oversea_config",sequenceName="seq_oversea_config",allocationSize=1)
	@GeneratedValue(generator="oversea_config",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Integer getSortcolum() {
		return sortcolum;
	}
	public void setSortcolum(Integer sortcolum) {
		this.sortcolum = sortcolum;
	}
	public String getChild_title() {
		return child_title;
	}
	public void setChild_title(String child_title) {
		this.child_title = child_title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	public Date getUpdtime() {
		return updtime;
	}
	public void setUpdtime(Date updtime) {
		this.updtime = updtime;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public String getOversea_icon() {
		return oversea_icon;
	}
	public void setOversea_icon(String oversea_icon) {
		this.oversea_icon = oversea_icon;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
