package com.oracle.test;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.BookDao;
import com.oracle.util.MyBatisUtil;

public class Test3 {

	public static void main(String[] args) {
		SqlSession session=MyBatisUtil.getSession();
		BookDao dao=session.getMapper(BookDao.class);
		System.out.println(dao.getAll());
	
		SqlSession session1=MyBatisUtil.getSession();
		BookDao dao1=session1.getMapper(BookDao.class);
		System.out.println(dao1.getAll());
		
		
		SqlSession session2=MyBatisUtil.getSession();
		BookDao dao2=session2.getMapper(BookDao.class);
		System.out.println(dao2.getAll());
		
		session.close();
		session1.close();
		session2.close();
	}

}
