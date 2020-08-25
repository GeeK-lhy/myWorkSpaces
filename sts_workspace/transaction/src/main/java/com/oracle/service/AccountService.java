package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.AccountDao;

@Service
public class AccountService {
	
	@Autowired
	AccountDao dao;
	@Transactional(propagation=Propagation.REQUIRES_NEW	)
	public void update(int accountId,int num) {
		//1.–ﬁ∏ƒ”‡∂Ó
		dao.updateRemain(accountId, num);
		//2.≈–∂œ”‡∂Ó
		int remain=dao.getAccountRemain(accountId);
		if(remain<0) {
			throw  new RuntimeException("”‡∂Ó≤ª◊„");
		}	
	
	}
	@Transactional
	public void updateRemain(int accountId,int num) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.updateRemain(accountId, num);
//		try {
//			Thread.sleep(5000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
	//	throw new RuntimeException("Œ¥Ã·Ωª≥…π¶");
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void getRemain(int accountId) {
		int remain=dao.getAccountRemain(accountId);
		System.out.println(remain);
		try { 
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		 remain=dao.getAccountRemain(accountId);
		System.out.println(remain);
		
	}
	
}
