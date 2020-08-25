package com.oracle.test;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.dao.EmpDao;
import com.oracle.vo.Emp;

public class AopTest {

	 static ClassPathXmlApplicationContext context =null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		context=new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void test() {
	Emp e=context.getBean(Emp.class);
		e.eat();
		
//		EmpDao dao=context.getBean(EmpDao.class);
//		dao.save(123, "james");
	}

}
