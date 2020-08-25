package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.SendAccidentDao;
import com.oracle.vo.SendAccident;

@Service
public class SendAccidentService {
	@Autowired
	SendAccidentDao dao;
	public void insertSendAccident(SendAccident sa) {
		dao.insertSendAccident(sa);
	}
	public void editSendAccident(SendAccident sa) {
		dao.editSendAccident(sa);
	}
	public void updateStatus(int newStatus,String sendaccident_id) {
		dao.updateStatus(newStatus, sendaccident_id);
	}
	
}
