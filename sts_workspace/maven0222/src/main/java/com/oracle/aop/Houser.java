package com.oracle.aop;

public class Houser implements Rentable {

	@Override
	public void rent(int money) {
		System.out.println("������Ƹ�ɹ�����Ƹ����Ϊ��"+money);

	}

}
