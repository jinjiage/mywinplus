package com.demo.model;

import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.SequenceGenerator;

/**
 * ��Ĺ���
 * @author Administrator
 *
 */
@Entity
public class SubjectPurchaseRecord {
	private Integer id;//ID
	private String serial_number;//流水号
	private Double amount;//购买金额
	private String deal_ip;//交易ip
	private Integer subject_id;//标的Id
	private Integer member_id;//
	private Integer delflag ;//
	private Date create_date;//创建时间
	private Date update_date;//修改时间
	private Double interest;//结算利息
	private Integer ispayment;//是否还款
	private Integer pay_interest_times;//0
	private Integer last_profit_day;//最后计息日
	private String bonus_info;//红包金额信息（app端实际投资额度+红包额度）
	private Integer  status;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Id
	@SequenceGenerator(name="subject_purchase_record",sequenceName="seq_subject_purchase_record",allocationSize=1)
	@GeneratedValue(generator="subject_purchase_record",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getDeal_ip() {
		return deal_ip;
	}
	public void setDeal_ip(String deal_ip) {
		this.deal_ip = deal_ip;
	}
	
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(Integer delflag) {
		this.delflag = delflag;
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
	
	public Double getInterest() {
		return interest;
	}
	public void setInterest(Double interest) {
		this.interest = interest;
	}
	public Integer getIspayment() {
		return ispayment;
	}
	public void setIspayment(Integer ispayment) {
		this.ispayment = ispayment;
	}
	public Integer getPay_interest_times() {
		return pay_interest_times;
	}
	public void setPay_interest_times(Integer pay_interest_times) {
		this.pay_interest_times = pay_interest_times;
	}
	public Integer getLast_profit_day() {
		return last_profit_day;
	}
	public void setLast_profit_day(Integer last_profit_day) {
		this.last_profit_day = last_profit_day;
	}
	public String getBonus_info() {
		return bonus_info;
	}
	public void setBonus_info(String bonus_info) {
		this.bonus_info = bonus_info;
	}
	
	
}
