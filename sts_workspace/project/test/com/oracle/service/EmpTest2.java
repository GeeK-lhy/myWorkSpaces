package com.oracle.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.oracle.vo.Emp;

class EmpTest2 {
	static EmpService service;
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		service=new EmpService();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testGetAll() {
	List<Emp>list=service.getAll();
	for(Emp e:list) {
		System.out.println(e);
	}
	}

	@Test
	void testLogin() {
		
	}

}
