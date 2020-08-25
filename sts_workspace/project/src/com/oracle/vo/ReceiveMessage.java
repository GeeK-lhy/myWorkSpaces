package com.oracle.vo;

import java.sql.Date;

public class ReceiveMessage {
	Integer receiveId;
	Integer sendId;
	Integer empId;
	Integer messageState;
	Date openDate;
	Emp receiver;
	
	public Emp getReceiver() {
		return receiver;
	}
	public void setReceiver(Emp receiver) {
		this.receiver = receiver;
	}
	public Integer getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(Integer receiveId) {
		this.receiveId = receiveId;
	}
	public Integer getSendId() {
		return sendId;
	}
	public void setSendId(Integer sendId) {
		this.sendId = sendId;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public Integer getMessageState() {
		return messageState;
	}
	public void setMessageState(Integer messageState) {
		this.messageState = messageState;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	@Override
	public String toString() {
		return "ReceiveMessage [receiveId=" + receiveId + ", sendId=" + sendId + ", empId=" + empId + ", messageState="
				+ messageState + ", openDate=" + openDate + "]";
	}
	
}
