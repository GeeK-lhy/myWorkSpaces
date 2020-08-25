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
		 //1.��ȡͼ��۸�
		int price=bookDao.getPrice(isbn);
	
		//2.�޸����
	//	accountDao.updateRemain(accountId,num*price);
	
		//3.�޸Ŀ��
		bookDao.updateBookStock(isbn, num);
		
		//4.�ж�����Ƿ��㹻
//		int remain=dao.getAccountRemain(accountId);
//		if(remain<0) {
//			throw  new RuntimeException("����");
//		}
	
		//5.�жϿ��
		int stock=bookDao.getBookStock(isbn);
		if(stock<0) {
			throw new RuntimeException("��治��");
		}

		accountService.update(accountId, num*price);
		System.out.println("����ɹ�");
	}
	
}
