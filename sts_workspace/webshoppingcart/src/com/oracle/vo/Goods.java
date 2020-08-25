package com.oracle.vo;

public class Goods {
	Book book;
	int num=0;
	public Goods(Book book, int num) {
		super();
		this.book = book;
		this.num = num;
	}
	public Goods() {
		super();
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
