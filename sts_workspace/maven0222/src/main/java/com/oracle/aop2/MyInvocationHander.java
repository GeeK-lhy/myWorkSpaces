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
		System.out.println("��ǰ���÷����ǣ�"+method.getName()+"����������:"+method.getParameterCount());
		System.out.println("�˴ε��÷���ʱ�Ĳ����ǣ�"+Arrays.toString(arg2));
		Object result=method.invoke(obj, arg2);
		System.out.println("������ϣ�����ֵ�ǣ�"+result);
		return result;
	}

}
