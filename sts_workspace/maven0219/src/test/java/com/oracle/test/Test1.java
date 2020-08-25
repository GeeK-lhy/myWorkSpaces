package com.oracle.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.vo.Person;

class Test1 {

	@Test
	void test() {
		BeanFactory factory=new ClassPathXmlApplicationContext("applicationContext.xml");
		Person p1=(Person) factory.getBean("sky");
		Person p2=(Person) factory.getBean("p2");
		//String[] names=factory.getAliases("sky");
//		p.setName("ÃÏ∆Ê’≈");
//		Person p1=(Person) factory.getBean("sky");
//		System.out.println(p1);

//		Class c=factory.getType("sky");
		
//	System.out.println(factory.isSingleton("sky"));
//		System.out.println(factory.containsBean("ÃÏ∆Ê"));
//		System.out.println(c.getName());
//		System.out.println(Arrays.toString(names));
		System.out.println(p1);
		System.out.println(p1.getDept());
		System.out.println(p2);
		System.out.println(p2.getDept());
	}

}
