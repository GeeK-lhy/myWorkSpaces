package com.oracle.vo;

import org.springframework.stereotype.Component;

@Component
public class Emp {
	int empNo;
	String name;
	
	public void eat() {
		System.out.println("ÎÒÕýÔÚ³Ô·¹");
	}
	
	
	@Override
	public String toString() {
		return "Emp [empNo=" + empNo + ", name=" + name + "]";
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
