package com.oracle.dao;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.oracle.vo.Book;
public interface BookDao {
	//@Select("select * from books")
	public	List<Book> getAll();
//	@Insert("insert into books values(null,#{bookName},#{price})")
	public  void save(Book book);
	public void delete(int isbn);
	public void update(Book book);
}
