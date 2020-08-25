package com.oracle.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.oracle.springcloud.entity.Dept;

public class Test1 {

	@Test
	public void test() {
		Dept dept=new Dept("lhy");
		System.out.println(dept);
	}

}
