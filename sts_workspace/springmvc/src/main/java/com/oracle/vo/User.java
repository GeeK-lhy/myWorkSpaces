package com.oracle.vo;

import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	String name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date birth;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Long time;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Calendar calendar;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Long getTime() {
		return time;
	}
	public void setTime(Long time) {
		this.time = time;
	}
	public Calendar getCalendar() {
		return calendar;
	}
	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", birth=" + birth + ", time=" +new Date( time) + ", calendar=" + calendar + "]";
	}
	
}
