package com.oracle.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDao {

	@Autowired
	JdbcTemplate jdbc;
	public void updateRemain(Integer account,Integer num) {
		jdbc.update("update account set remain=remain-? where accountId=?",num,account);
		
		
	}
	public int getAccountRemain(int account) {
		return jdbc.queryForObject("select remain from account where accountId=?",Integer.class,account);
	}

}
