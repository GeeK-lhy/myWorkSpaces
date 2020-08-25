package com.oracle.aop2;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Arrays;

public class MyInvocationHander implements InvocationHandler {

		Object obj;
		
	public MyInvocationHander(Object obj) {
			super();
			this.obj = obj;
		}


	public MyInvocationHander() {
		super();
	}


	@Override
	public Object invoke(Object arg0, Method method, Object[] arg2) throws Throwable {
		System.out.println("当前调用方法是："+method.getName()+"参数个数是:"+method.getParameterCount());
		System.out.println("此次调用方法时的参数是："+Arrays.toString(arg2));
		Object result=method.invoke(obj, arg2);
		System.out.println("调用完毕，返回值是："+result);
		return result;
	}

}
