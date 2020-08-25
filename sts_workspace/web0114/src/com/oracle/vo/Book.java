package com.oracle.vo;

public class Book {
	int isbn;
	String bookName;
	int price;
	public Book(int isbn, String bookName, int price) {
		super();
		this.isbn = isbn;
		this.bookName = bookName;
		this.price = price;
	}
	public Book() {
		super();
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
