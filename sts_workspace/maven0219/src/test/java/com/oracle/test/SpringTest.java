package com.oracle.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.vo.Person;

public class SpringTest {

	public static void main(String[] args) {
		BeanFactory b;
		ApplicationContext factory=new ClassPathXmlApplicationContext("applicationContext.xml");
		//Person p=(Person) factory.getBean("p");
		Person p=(Person) factory.getBean(Person.class);
		
		System.out.println(p);
	}

}
