package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.PersonDao;
import com.oracle.vo.Person;
@Service
public class PersonService {
	@Autowired
	PersonDao pd;
	public void register(Person p) {
		System.out.println("¿ªÊ¼×¢²á£º");
		pd.save(p);
	}
}
