package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Book;

@Repository
public interface BookDao {
	public void save(Book book); 
	
	public List<Book> getAll();
	
	public Book getBookById(@Param("isbn") int isbn);

}
