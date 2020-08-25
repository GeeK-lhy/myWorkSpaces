package com.oracle.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.dao.BookDao;
import com.oracle.service.BookService;
import com.oracle.vo.Books;

public class JdbcTest {
	static ClassPathXmlApplicationContext context=null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		context=new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void test() {
		BookDao dao=context.getBean(BookDao.class);
//		Books book=new Books();
//		book.setIsbn(5199);
//		book.setName("Ò£Ô¶µÄÎ´À´");
//		book.setPrice(100);
//		dao.save(book);
//		System.out.println(dao.getCount());
//		dao.getBookById(5199);
//		List<Books> list= dao.getBooks();
//		for(Books b:list) {
//			System.out.println(b);
//		}
		BookService service=context.getBean(BookService.class);
		Books book=new Books();
		book.setIsbn(41);
		book.setName("Jvm");
		book.setPrice(100);
		service.save(book);
	}

}
