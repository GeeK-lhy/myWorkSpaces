package com.oracle.aop3;

import java.lang.reflect.Method;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

public class CglibMethodInterceptor implements MethodInterceptor {

	Object target;//真实对象；
	
	//返回一个代理对象
	public Object getInstance(Object obj) {
			this.target=obj;
			Enhancer e=new Enhancer();
			e.setCallback(this);
			e.setSuperclass(target.getClass());
			return e.create();
	}
	
	/**
	 * 每次调用代理对象的方法时，会回调此方法；这个方法相当于InvocationHandler 的 invoke 方法
	 */
	@Override
	public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
		System.out.println(method.getName()+"方法被调用");
		Object result=proxy.invokeSuper(obj,args);
		System.out.println("方法调用完毕，返回值为"+result);
		return result;
	}

}
