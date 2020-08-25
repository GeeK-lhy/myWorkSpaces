package com.oracle.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.vo.Person;

class Text2 {

	@Test
	void test() {
		ClassPathXmlApplicationContext factory=new ClassPathXmlApplicationContext("applicationContext.xml");
		Person p1=(Person)factory.getBean("p1");
		System.out.println(p1);
		System.out.println(Arrays.toString(p1.getHobby()));
		System.out.println("技能如下：");
		System.out.println(p1.getSkills());
		System.out.println("教育经历如下：");
		System.out.println(p1.getEdu());
		System.out.println("课程成绩");
		System.out.println(p1.getSubject());
		
		System.out.println("武器：");
		System.out.println(p1.getWeapon());
		
		System.out.println(p1.getProps());
		//factory.close();
		Person p2=(Person)factory.getBean("p2");
		System.out.println(p2.getSkills());
		
	}

}
