package com.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * 用户基本表
 * @author 
 *
 */
@Entity
public class Member {
    private Integer id;//用户id
	private String member_name;//真实姓名
	private String name;//用户名
	private String password;//密码
	private String salt;//密码盐
	private String mobile_Phone;//手机号
	private Integer status;//账号状态（正常，锁定，删除）
	private Integer del_flag ;//删除标志
	private String identity;//身份
	private Date create_date;//创建时间
	private Date update_date;//修改时间
	private String weiBoAccount;//微博账号关联
	private String weixinAccount;//微信账号关联
	private Integer headid;//头像图片id
	private String invitationCode;//邀请码
	private String withdraw_password;//提款密码
	private String qqAccount;//QQ账号关联
	private String invitedCode;//被邀请码
	private String qqNumber;//QQ号码
	
	@Id
	@SequenceGenerator(name="member",sequenceName="seq_member",allocationSize=1)
	@GeneratedValue(generator="member",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getMobile_Phone() {
		return mobile_Phone;
	}
	public void setMobile_Phone(String mobile_Phone) {
		this.mobile_Phone = mobile_Phone;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
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
	@Column(name="weiboaccount")
	public String getWeiBoAccount() {
		return weiBoAccount;
	}
	public void setWeiBoAccount(String weiBoAccount) {
		this.weiBoAccount = weiBoAccount;
	}
	@Column(name="weixinaccount")
	public String getWeixinAccount() {
		return weixinAccount;
	}
	public void setWeixinAccount(String weixinAccount) {
		this.weixinAccount = weixinAccount;
	}
	public Integer getHeadid() {
		return headid;
	}
	public void setHeadid(Integer headid) {
		this.headid = headid;
	}
	@Column(name="invitationcode")
	public String getInvitationCode() {
		return invitationCode;
	}
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
	public String getWithdraw_password() {
		return withdraw_password;
	}
	public void setWithdraw_password(String withdraw_password) {
		this.withdraw_password = withdraw_password;
	}
	@Column(name="qqaccount")
	public String getQqAccount() {
		return qqAccount;
	}
	public void setQqAccount(String qqAccount) {
		this.qqAccount = qqAccount;
	}
	@Column(name="invitedcode")
	public String getInvitedCode() {
		return invitedCode;
	}
	public void setInvitedCode(String invitedCode) {
		this.invitedCode = invitedCode;
	}
	@Column(name="qqnumber")
	public String getQqNumber() {
		return qqNumber;
	}
	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}
	
	
}
