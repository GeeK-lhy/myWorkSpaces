package com.oracle.test;
import com.oracle.decorator.*;
public class Test {

	public static void main(String[] args) {
		
		Component w=new BackGroundDecorator(new ScrollDecorator(new Window()));
		w.display();
	}

}
