package com.oracle.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.AccidentDao;
import com.oracle.vo.Accident;

@Service
public class AccidentService {
	@Autowired
	AccidentDao dao;
	public void saveAccident(Accident accident) {
		dao.saveAccident(accident);
	}
}
