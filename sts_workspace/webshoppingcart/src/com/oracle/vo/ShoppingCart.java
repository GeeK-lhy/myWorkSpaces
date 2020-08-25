package com.oracle.vo;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ShoppingCart {
//	List<Book> goods=new ArrayList<Book>();
	int variety=0;
	Map<Integer,Goods>map=new HashMap<Integer,Goods>();
	Integer totalPrice=0;

 public int getVariety() {
		return variety;
	}
	public void setVariety(int variety) {
		this.variety = variety;
	}
	public Map<Integer, Goods> getMap() {
		return map;
	}
	public void setMap(Map<Integer, Goods> map) {
		this.map = map;
	}
	public Integer getTotalPrice() {
		return totalPrice();
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
public void addGoods(int isbn,Goods g) {
	 this.map.put(isbn, g);
	 this.variety=this.variety+1;
 }
 public void addNum(int isbn) {
	 this.map.get(isbn).num++;
 }
 public void reduce(int isbn) {
	 if(map.get(isbn).num>1)
	 this.map.get(isbn).num--;
	 else
		 delete(isbn);
 }
 public void delete(int isbn) {
	 this.map.remove(isbn);
	 this.variety=this.variety-1;
 }
 public int totalPrice() {
	 this.totalPrice=0;
	 for(Goods g:this.map.values()) {
		 this.totalPrice+=g.num*g.book.price;
	 }
	 return this.totalPrice;
 }
}
