package com.oracle.dao;

import org.springframework.stereotype.Repository;

import com.oracle.vo.Customer;

@Repository
public interface CustomerDao {
	public void addCustomer(Customer c);
}
