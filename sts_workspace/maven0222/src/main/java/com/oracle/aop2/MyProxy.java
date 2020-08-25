package com.oracle.aop2;

import java.lang.reflect.Proxy;

public class MyProxy {

	public static void main(String[] args) {
	Calculate c=(Calculate) Proxy.newProxyInstance(MyProxy.class.getClassLoader(),new Class[] {Calculate.class},new MyInvocationHander(new CalculateImpl()));
		c.add(1, 2);
		c.minus(3, 2);
		c.mult(3, 3);
		c.devi(100, 2);
	}

}
