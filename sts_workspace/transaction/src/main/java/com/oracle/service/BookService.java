package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.AccountDao;
import com.oracle.dao.BookDao;

@Service
public class BookService {
	
	@Autowired
	BookDao bookDao;
	@Autowired
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	public void buy(int accountId,int isbn,int num) {
		 //1.ªÒ»°Õº Èº€∏Ò
		int price=bookDao.getPrice(isbn);
	
		//2.–ﬁ∏ƒ”‡∂Ó
	//	accountDao.updateRemain(accountId,num*price);
	
		//3.–ﬁ∏ƒø‚¥Ê
		bookDao.updateBookStock(isbn, num);
		
		//4.≈–∂œ”‡∂Ó «∑Ò◊„πª
//		int remain=dao.getAccountRemain(accountId);
//		if(remain<0) {
//			throw  new RuntimeException("”‡∂Ó≤ª◊„");
//		}
	
		//5.≈–∂œø‚¥Ê
		int stock=bookDao.getBookStock(isbn);
		if(stock<0) {
			throw new RuntimeException("ø‚¥Ê≤ª◊„");
		}

		accountService.update(accountId, num*price);
		System.out.println("π∫¬Ú≥…π¶");
	}
	
}
