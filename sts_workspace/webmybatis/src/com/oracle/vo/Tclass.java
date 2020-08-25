package com.oracle.vo;

import java.util.List;

public class Tclass implements java.io.Serializable{
	Integer classId;
	String className;
	String descript;
	List<Student> students;
	
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Tclass(Integer classId, String className, String descript) {
		super();
		this.classId = classId;
		this.className = className;
		this.descript = descript;
	}
	public Tclass(String className, String descript) {
		super();
		this.className = className;
		this.descript = descript;
	}
	public Tclass() {
		super();
	}
	@Override
	public String toString() {
		return "Class [classId=" + classId + ", className=" + className + ", descript=" + descript + "]";
	}
	
}
