package com.oracle.vo;

import java.math.BigInteger;

public class Mobile {
	int id;
	BigInteger mobile_Number;
	String mobile_Type;
	String card_Number;//卡号
	String is_Avaliable;//此号码是否可用
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BigInteger getMobile_Number() {
		return mobile_Number;
	}
	public void setMobile_Number(BigInteger mobile_Number) {
		this.mobile_Number =  mobile_Number;
	}
	public String getMobile_Type() {
		return mobile_Type;
	}
	public void setMobile_Type(String mobile_Type) {
		this.mobile_Type = mobile_Type;
	}
	public String getCard_Number() {
		return card_Number;
	}
	public void setCard_Number(String card_Number) {
		this.card_Number = card_Number;
	}
	public String getIs_Avaliable() {
		return is_Avaliable;
	}
	public void setIs_Avaliable(String is_Avaliable) {
		this.is_Avaliable = is_Avaliable;
	}
	@Override
	public String toString() {
		return "Mobile [id=" + id + ", mobile_Number=" + mobile_Number + ", mobile_Type=" + mobile_Type
				+ ", card_Number=" + card_Number + ", is_Avaliable=" + is_Avaliable + "]";
	}
	
}
