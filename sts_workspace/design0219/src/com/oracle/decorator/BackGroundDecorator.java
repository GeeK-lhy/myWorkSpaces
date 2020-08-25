package com.oracle.decorator;

public class BackGroundDecorator extends Decorator {
	public BackGroundDecorator(Component cmp) {
		super(cmp);
	}

	@Override
	public void display() {
		// TODO Auto-generated method stub
		super.display();
		System.out.println("为组建增加一个背景");
	}
	
}
