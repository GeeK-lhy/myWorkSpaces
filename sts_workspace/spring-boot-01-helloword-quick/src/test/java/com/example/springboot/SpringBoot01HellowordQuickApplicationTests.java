package com.example.springboot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.springboot.been.Person;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBoot01HellowordQuickApplicationTests {
	@Autowired
	Person person;
	@Test
	public void contextLoads() {
		System.out.println(person);
	}

}
