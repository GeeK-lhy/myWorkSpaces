package com.oracle.dao;

import org.springframework.stereotype.Repository;

@Repository
public class EmpDao {
	public int  save(int empNo,String name) {
		System.out.println("������һ��Ա����"+name);
		return 100;
	}
}
