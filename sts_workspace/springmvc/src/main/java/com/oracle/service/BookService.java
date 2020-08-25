package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.BookDao;
import com.oracle.vo.Book;

@Service
public class BookService {

	@Autowired
	BookDao dao;
	@Transactional
	public void save(Book book) {
		dao.save(book);
	}
	@Transactional(readOnly=true)
	public List<Book> getAll(){
		List list=dao.getAll();
		return list;
	}
	public Book getBookById(int isbn) {
		return dao.getBookById(isbn);
	}
}
