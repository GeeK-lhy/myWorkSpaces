package com.oracle.vo;

public class Charge {
	String charge_Code;//费用代码
	String charge_Name;//费用名
	int charge;//费用
	public String getCharge_Code() {
		return charge_Code;
	}
	public void setCharge_Code(String charge_Code) {
		this.charge_Code = charge_Code;
	}
	public String getCharge_Name() {
		return charge_Name;
	}
	public void setCharge_Name(String charge_Name) {
		this.charge_Name = charge_Name;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	@Override
	public String toString() {
		return "Charge [charge_Code=" + charge_Code + ", charge_Name=" + charge_Name + ", charge=" + charge + "]";
	}
	
}
