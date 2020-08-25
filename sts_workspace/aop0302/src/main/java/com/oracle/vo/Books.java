package com.oracle.vo;

public class Books {
	Integer isbn;
	String name;
	Integer price;
	public Integer getIsbn() {
		return isbn;
	}
	public void setIsbn(Integer isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Books [isbn=" + isbn + ", name=" + name + ", price=" + price + "]";
	}
	
}
