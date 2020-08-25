package com.oracle.vo;

import java.util.Date;

public class Student {
	Integer studentID;
	Integer classId;
	String name;
	Date 	birth;
	String degree;
	String carId;
	String city;
	double salary;
	String descript;
	Tclass tclass;
	
	public Tclass getTclass() {
		return tclass;
	}
	public void setTclass(Tclass tclass) {
		this.tclass = tclass;
	}
	public Integer getStudentID() {
		return studentID;
	}
	public void setStudentID(Integer studentID) {
		this.studentID = studentID;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String studentName) {
//		this.name = studentName;
//	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}


	public Student() {
		super();
	}
	@Override
	public String toString() {
		return "Student [studentID=" + studentID + ", classId=" + classId + ",name=" + name + ", birth="
				+ birth + ", degree=" + degree + ", carId=" + carId + ", city=" + city + ", salary=" + salary
				+ ", descript=" + descript + "]";
	}
	
}
