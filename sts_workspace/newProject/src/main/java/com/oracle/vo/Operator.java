package com.oracle.vo;

public class Operator {
	int id;
	int operator_Id;
	String operator_Name;
	String operator_Pwd;
	int is_Admin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOperator_Id() {
		return operator_Id;
	}
	public void setOperator_Id(int operator_Id) {
		this.operator_Id = operator_Id;
	}
	public String getOperator_Name() {
		return operator_Name;
	}
	public void setOperator_Name(String operator_Name) {
		this.operator_Name = operator_Name;
	}
	public String getOperator_Pwd() {
		return operator_Pwd;
	}
	public void setOperator_Pwd(String operator_Pwd) {
		this.operator_Pwd = operator_Pwd;
	}
	public int getIs_Admin() {
		return is_Admin;
	}
	public void setIs_Admin(int is_Admin) {
		this.is_Admin = is_Admin;
	}
	
	@Override
	public String toString() {
		return "Operator [id=" + id + ", operator_Id=" + operator_Id + ", operator_Name=" + operator_Name
				+ ", operator_Pwd=" + operator_Pwd + ", is_Admin=" + is_Admin + "]";
	}
	
	
}
