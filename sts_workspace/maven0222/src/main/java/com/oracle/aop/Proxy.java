package com.oracle.aop;

public class Proxy implements Rentable {
	Houser h=new Houser();
	@Override
	public void rent(int money) {
		System.out.println("中介费用为："+money/5);
			h.rent(4*(money/5));

	}

}
