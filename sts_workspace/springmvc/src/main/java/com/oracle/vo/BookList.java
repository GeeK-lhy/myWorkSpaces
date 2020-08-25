package com.oracle.vo;

import java.util.List;

public class BookList {
	List<Book> books;

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "BookList [books=" + books + "]";
	}
	
}
