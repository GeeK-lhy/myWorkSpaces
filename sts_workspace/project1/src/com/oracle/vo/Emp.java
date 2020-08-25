package com.oracle.vo;

public class Emp {
	Integer empId;
	String empNo;
	String  empName;
	String password;
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empNo=" + empNo + ", empName=" + empName + ", password=" + password + "]";
	}
	public Emp() {
		super();
	}
	
}
