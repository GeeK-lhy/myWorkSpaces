package com.oracle.vo;

public class Customer {
	int customer_Id;
	String id_Type;
	String id_Number;
	String customer_Name;
	String customer_Birthday;
	String customer_Sex;
	String customer_Address;

	public int getCustomer_Id() {
		return customer_Id;
	}
	public void setCustomer_Id(int customer_Id) {
		this.customer_Id = customer_Id;
	}
	public String getId_Type() {
		return id_Type;
	}
	public void setId_Type(String id_Type) {
		this.id_Type = id_Type;
	}
	public String getId_Number() {
		return id_Number;
	}
	public void setId_Number(String id_Number) {
		this.id_Number = id_Number;
	}
	public String getCustomer_Name() {
		return customer_Name;
	}
	public void setCustomer_Name(String customer_Name) {
		this.customer_Name = customer_Name;
	}
	public String getCustomer_Birthday() {
		return customer_Birthday;
	}
	public void setCustomer_Birthday(String customer_Birthday) {
		this.customer_Birthday = customer_Birthday;
	}
	public String getCustomer_Sex() {
		return customer_Sex;
	}
	public void setCustomer_Sex(String customer_Sex) {
		this.customer_Sex = customer_Sex;
	}
	public String getCustomer_Address() {
		return customer_Address;
	}
	public void setCustomer_Address(String customer_Address) {
		this.customer_Address = customer_Address;
	}
	@Override
	public String toString() {
		return "Customer [ customer_Id=" + customer_Id + ", id_Type=" + id_Type + ", id_Number="
				+ id_Number + ", customer_Name=" + customer_Name + ", customer_Birthday=" + customer_Birthday
				+ ", customer_Sex=" + customer_Sex + ", customer_Address=" + customer_Address + "]";
	}
	public Customer( String id_Type, String id_Number, String customer_Name, String customer_Birthday,
			String customer_Sex, String customer_Address) {
		//super();
		this.id_Type = id_Type;
		this.id_Number = id_Number;
		this.customer_Name = customer_Name;
		this.customer_Birthday = customer_Birthday;
		this.customer_Sex = customer_Sex;
		this.customer_Address = customer_Address;
	}
	
	
}
