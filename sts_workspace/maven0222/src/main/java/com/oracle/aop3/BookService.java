package com.oracle.aop3;

public class BookService {
	@Sql("delete from books where isbn=123")
	public void delete() {
		System.out.println("����book��delete����");
	}
}	
