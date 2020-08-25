package com.oracle.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.vo.Person;

class Test3 {

	@Test
	void test() {
		ClassPathXmlApplicationContext factory=new ClassPathXmlApplicationContext("applicationContext1.xml");
		Person p=(Person)factory.getBean("p");
	
		//System.out.println(p.getDept());
		Person p1=(Person)factory.getBean("p1");
		
		System.out.println(p1);
		System.out.println(p1.getDept());
	}

}
