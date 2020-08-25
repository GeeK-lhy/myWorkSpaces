package com.oracle.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.dao.PersonDao;
import com.oracle.service.PersonService;
import com.oracle.vo.Person;

class AnnotationTest {

	@Test
	void test() {
		ClassPathXmlApplicationContext factory=new ClassPathXmlApplicationContext("AnnotationContext.xml");
//		PersonDao dao=factory.getBean(PersonDao.class);
//		dao.save(new Person("james",23));
//		
//		Person p=factory.getBean(Person.class);
//		p.setName("melo");
//		System.out.println(p);
		PersonService service=factory.getBean(PersonService.class);
		service.register(new Person("james",33));
	}

}
