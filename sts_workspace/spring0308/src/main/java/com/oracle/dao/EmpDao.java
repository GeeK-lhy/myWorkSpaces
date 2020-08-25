package com.oracle.dao;

import org.springframework.stereotype.Repository;

@Repository
public class EmpDao {
	public int  save(int empNo,String name) {
		System.out.println("增加了一个员工："+name);
		return 100;
	}
}
