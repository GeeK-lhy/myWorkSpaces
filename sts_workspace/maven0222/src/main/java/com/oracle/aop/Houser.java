package com.oracle.aop;

public class Houser implements Rentable {

	@Override
	public void rent(int money) {
		System.out.println("房屋租聘成功：租聘费用为："+money);

	}

}
