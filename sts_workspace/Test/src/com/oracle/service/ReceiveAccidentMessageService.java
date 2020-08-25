package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.ReceiveAccidentDao;
import com.oracle.vo.ReceiveAccidentVo;
import java.util.*;
@Service
public class ReceiveAccidentMessageService {
	@Autowired
	ReceiveAccidentDao dao;
	public void insertReceiveAccident(ReceiveAccidentVo ra) { 
		dao.insertReceiveAccident(ra);
	}
	public void updateStatus(String status,String receiveaccident_id) {
		dao.updateStatus(status,receiveaccident_id);
	}
	public List<ReceiveAccidentVo> selectByStatus(String receiveUser){
		return dao.selectByStatus(receiveUser);
	}
	public ReceiveAccidentVo selecrById(String id) {
		return dao.selectById(id);
	}
}
