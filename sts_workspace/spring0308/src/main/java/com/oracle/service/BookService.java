package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.BookDao;
import com.oracle.vo.Books;

@Service
public class BookService {
	@Autowired
	BookDao dao;
	@Transactional
	public void save(Books book) {
		dao.save(book);
		book.setIsbn(book.getIsbn()+1);
		dao.save(book);
		System.out.println("≤Â»Î≥…π¶");
	}
}
