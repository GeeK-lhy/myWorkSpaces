package com.oracle.vo;

import java.util.Date;

public class Student implements java.io.Serializable{
	Integer studentId;
	Integer classId;
	String studentName;
	Date 	birth;
	String degree;
	String carId;
	String city;
	double salary;
	String descript;
	Tclass tclass;
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
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
	public Tclass getTclass() {
		return tclass;
	}
	public void setTclass(Tclass tclass) {
		this.tclass = tclass;
	}
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", classId=" + classId + ", studentName=" + studentName + ", birth="
				+ birth + ", degree=" + degree + ", carId=" + carId + ", city=" + city + ", salary=" + salary
				+ ", descript=" + descript + "]";
	}
	

	
}
