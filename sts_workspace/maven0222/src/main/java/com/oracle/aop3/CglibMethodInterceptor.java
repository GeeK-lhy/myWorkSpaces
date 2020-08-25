package com.oracle.aop3;

import java.lang.reflect.Method;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

public class CglibMethodInterceptor implements MethodInterceptor {

	Object target;//��ʵ����
	
	//����һ���������
	public Object getInstance(Object obj) {
			this.target=obj;
			Enhancer e=new Enhancer();
			e.setCallback(this);
			e.setSuperclass(target.getClass());
			return e.create();
	}
	
	/**
	 * ÿ�ε��ô������ķ���ʱ����ص��˷�������������൱��InvocationHandler �� invoke ����
	 */
	@Override
	public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
		System.out.println(method.getName()+"����������");
		Object result=proxy.invokeSuper(obj,args);
		System.out.println("����������ϣ�����ֵΪ"+result);
		return result;
	}

}
