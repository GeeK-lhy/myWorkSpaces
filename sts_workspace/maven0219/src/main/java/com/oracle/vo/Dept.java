package com.oracle.vo;

public class Dept {

	String dname;
	String loc;
	int deptNo;
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	@Override
	public String toString() {
		return "Dept [dname=" + dname + ", loc=" + loc + ", deptNo=" + deptNo + "]";
	}
	
}
