package com.oracle.service;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.MobileDao;
import com.oracle.vo.Mobile;

@Service
public class MobileService {
	
	@Autowired
	MobileDao dao;
	public void addMobiles(Map<String,Object>map) {
		dao.addMobiles(map);
	}
	public Mobile getNumber(BigInteger number) {
		return dao.getNumber(number);
	}
	public void updateAvailable(BigInteger number) {
		dao.updateAvailable(number);
	}
	public int checkAvailable() {
		return dao.checkAvailable();
	}
}
