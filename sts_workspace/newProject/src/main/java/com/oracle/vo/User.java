package com.oracle.vo;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;

public class User {
	int user_Id;
	BigInteger Mobile_Number;
	String Roaming_Status;
	String com_Level;
	int customer_Id;
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public BigInteger getMobile_Number() {
		return Mobile_Number;
	}
	public void setMobile_Number(BigInteger mobile_Number) {
		Mobile_Number = mobile_Number;
	}
	public String getRoaming_Status() {
		return Roaming_Status;
	}
	public void setRoaming_Status(String roaming_Status) {
		Roaming_Status = roaming_Status;
	}
	public String getCom_Level() {
		return com_Level;
	}
	public void setCom_Level(String com_Level) {
		this.com_Level = com_Level;
	}
	public int getCustomer_Id() {
		return customer_Id;
	}
	public void setCustomer_Id(int customer_Id) {
		this.customer_Id = customer_Id;
	}
	@Override
	public String toString() {
		return "User [user_Id=" + user_Id + ", Mobile_Number=" + Mobile_Number + ", Roaming_Status=" + Roaming_Status
				+ ", com_Level=" + com_Level + ", customer_Id=" + customer_Id + "]";
	}
	
}
