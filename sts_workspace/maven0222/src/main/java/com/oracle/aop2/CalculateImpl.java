package com.oracle.aop2;

public class CalculateImpl implements Calculate {

	@Override
	public int add(int a, int b) {
		// TODO Auto-generated method stub
		return a+b;
	}

	@Override
	public int minus(int a, int b) {
		// TODO Auto-generated method stub
		return a-b;
	}

	@Override
	public int mult(int a, int b) {
		// TODO Auto-generated method stub
		return a*b;
	}

	@Override
	public int devi(int a, int b) {
		// TODO Auto-generated method stub
		return a/b;
	}

}
