package com.oracle.decorator;

public class ScrollDecorator extends Decorator {

	public ScrollDecorator(Component component) {
		super(component);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void display() {
		// TODO Auto-generated method stub
		super.display();
		System.out.println("为组组件增加一个滚动条");
	}

}
