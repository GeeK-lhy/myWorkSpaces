package com.oracle.dao;
import java.util.List;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.*;
public class BookDao {
	public List<Book>  getAll(){
		
		return Dao.query("select * from books",Book.class);
	}
	public void insert(Book book) {
		Dao.executeSql("insert into books values(null,?,?)",book.getBookName(),book.getPrice());
	}
	public void delete(int isbn) {
	Dao.executeSql("delete from books where isbn=?",isbn);	
	}
	public Book getBookById(int isbn) {
		return Dao.queryOne("select * from books where isbn=?", Book.class,isbn);
	}
	public void update(Book book) {
		Dao.executeSql("update books set bookName=?,price=? where isbn=?",book.getBookName(),book.getPrice(),book.getIsbn());
	}
}
