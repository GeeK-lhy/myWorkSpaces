package com.oracle.dao;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.oracle.vo.Person;
@Repository
public class PersonDao {
	public void save(Person p) {
		System.out.println("������һ���ˣ�"+p);
	}
	public void delete(Person p) {
		System.out.println("ɾ����"+p);
	}
}	
