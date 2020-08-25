package com.oracle.vo;

public class ChargeRule {
	Integer id;
	String func_Id;
	String charge_Code;
	String func_Name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFunc_Id() {
		return func_Id;
	}
	public void setFunc_Id(String func_Id) {
		this.func_Id = func_Id;
	}
	public String getCharge_Code() {
		return charge_Code;
	}
	public void setCharge_Code(String charge_Code) {
		this.charge_Code = charge_Code;
	}
	public String getFunc_Name() {
		return func_Name;
	}
	public void setFunc_Name(String func_Name) {
		this.func_Name = func_Name;
	}
	@Override
	public String toString() {
		return "ChargeRule [id=" + id + ", func_Id=" + func_Id + ", charge_Code=" + charge_Code + ", func_Name="
				+ func_Name + "]";
	}
	public ChargeRule(String func_Id, String charge_Code, String func_Name) {
		super();
		this.func_Id = func_Id;
		this.charge_Code = charge_Code;
		this.func_Name = func_Name;
	}

	
		
}
