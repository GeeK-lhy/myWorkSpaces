package com.oracle.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.service.BookService;
import com.oracle.vo.Book;

public class TestBook {

	ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
	public void test() {
		BookService service=context.getBean(BookService.class);
		Book b=new Book();

		b.setBookName("wyj");
		b.setPrice(629);
		service.save(b);
	}

}
