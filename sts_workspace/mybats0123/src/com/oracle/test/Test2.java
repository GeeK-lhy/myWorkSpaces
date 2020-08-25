package com.oracle.test;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.BookDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Book;

public class Test2 {

	public static void main(String[] args) {
		try(SqlSession session=MyBatisUtil.getSession();){
			BookDao dao=session.getMapper(BookDao.class);
			Book book=new Book("Wyj",89);
//			Book b=new Book(1005,"Wyj",519);
//			System.out.println(dao.getAll());
			dao.delete(1007);
			dao.save(book);
			System.out.println(book);
			session.commit();
			
		}
		
	}

}
