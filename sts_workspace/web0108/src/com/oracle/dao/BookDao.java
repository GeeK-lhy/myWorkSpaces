package com.oracle.dao;

import java.util.List;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.Book;

public class BookDao {
		
	public List<Book> getAll(){
		return Dao.query("select * from books",Book.class);
	}
	public void add(Book book) {
		 Dao.executeSql("insert into books values(null,?,?)",book.getBookName(),book.getPrice());
	}
	
}
