package com.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * ��ҵ����
 * @author Administrator
 *
 */
@Entity
public class SysBizInstitution {


	private Integer id;//id
	private String province;//省
	private String city;//城市
	private String biz_type;//机构类别如缴费JF
	private String biz_sub_type;//机构子类别如缴费水费WATER
	private String institution_name;//机构名称
	private String institution_code;//机构编码
	@Id
	@SequenceGenerator(name="sys_biz_institution",sequenceName="seq_sys_biz_institution",allocationSize=1)
	@GeneratedValue(generator="sys_biz_institution",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public String getBiz_sub_type() {
		return biz_sub_type;
	}
	public void setBiz_sub_type(String biz_sub_type) {
		this.biz_sub_type = biz_sub_type;
	}
	public String getInstitution_name() {
		return institution_name;
	}
	public void setInstitution_name(String institution_name) {
		this.institution_name = institution_name;
	}
	public String getInstitution_code() {
		return institution_code;
	}
	public void setInstitution_code(String institution_code) {
		this.institution_code = institution_code;
	}
	
	
}
