package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.CustomerDao;
import com.oracle.vo.Customer;

@Service
public class AccountService {
	@Autowired
	CustomerDao dao;
	public void addCustomer(Customer c){
		dao.addCustomer(c);
	}
	
}
