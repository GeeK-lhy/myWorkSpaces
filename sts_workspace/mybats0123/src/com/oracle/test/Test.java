package com.oracle.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.oracle.dao.BookDao;
import com.oracle.vo.Book;

public class Test {

	public static void main(String[] args) throws Exception {
		//读取核心配置文件的数据
		String resource = "configuration.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		//创建session工厂
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session=factory.openSession();
//		List<Object> list=session.selectList("getAll");
//		for(Object obj:list) {
//			System.out.println(obj);
//		}
//		Book book=new Book(1,"Lhy",629);
//		session.insert("save",book);
//		session.commit();
//		session.close();
		BookDao dao=session.getMapper(BookDao.class);
		System.out.println(dao.getAll());
	}

}
