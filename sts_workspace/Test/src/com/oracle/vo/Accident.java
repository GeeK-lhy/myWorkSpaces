package com.oracle.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Accident {
	Integer accidenthandle_id;
	String title;
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	Date time;
	String source;
	String accidentType;
	String grade;
	String address;
	String responseGrade;
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	Date sendTime;
	String casualty;
	String economicLoss;
	String reason;
	String picAddress;
	String units;
	String addressRemark;
	
	public String getAddressRemark() {
		return addressRemark;
	}
	public void setAddressRemark(String addressRemark) {
		this.addressRemark = addressRemark;
	}
	public Integer getAccidenthandle_id() {
		return accidenthandle_id;
	}
	public void setAccidenthandle_id(Integer accidenthandle_id) {
		this.accidenthandle_id = accidenthandle_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getAccidentType() {
		return accidentType;
	}
	public void setAccidentType(String accidentType) {
		this.accidentType = accidentType;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getResponseGrade() {
		return responseGrade;
	}
	public void setResponseGrade(String responseGrade) {
		this.responseGrade = responseGrade;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getCasualty() {
		return casualty;
	}
	public void setCasualty(String casualty) {
		this.casualty = casualty;
	}
	public String getEconomicLoss() {
		return economicLoss;
	}
	public void setEconomicLoss(String economicLoss) {
		this.economicLoss = economicLoss;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPicAddress() {
		return picAddress;
	}
	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	
}
