package com.oracle.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.OperatorDao;
import com.oracle.vo.Operator;

@Service
public class OperatorService {
	@Autowired
	OperatorDao dao;
	public Operator getOperator(Map<String,Object>map) {
		return dao.getOperator(map);
	}
	public int getAdmin(int id) {
		return dao.getAdmin(id);
	}
}
