package com.oracle.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookDao {
	@Autowired
	JdbcTemplate jdbc;
	
	public void updateBookStock(int isbn,int num) {
		jdbc.update("update bookstock set stock=stock-? where isbn=?",num,isbn);
	}
	
	public int getBookStock(int isbn) {
		return jdbc.queryForObject("select stock from bookstock where isbn=? ",Integer.class,isbn);
		
	}
	public int getPrice(int isbn) {
		return jdbc.queryForObject("select price from books where isbn=?",Integer.class,isbn);
		
	}
	


}
