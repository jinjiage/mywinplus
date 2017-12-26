package com.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
/**
 * ��ֵ������
 * @author Administrator
 *
 */
@Entity
public class SysRechargePriceConfig {

	private Integer id;//
	private String type;//类型
	private Integer market_price;//金额
	private Integer sell_price;//金额	
	private Date create_date;//创建时间
	private Date update_date;//修改时间
	@Id
	@SequenceGenerator(name="sys_recharge_price_config",sequenceName="seq_sys_recharge_price_config",allocationSize=1)
	@GeneratedValue(generator="sys_recharge_price_config",strategy=GenerationType.SEQUENCE)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Integer market_price) {
		this.market_price = market_price;
	}
	public Integer getSell_price() {
		return sell_price;
	}
	public void setSell_price(Integer sell_price) {
		this.sell_price = sell_price;
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
