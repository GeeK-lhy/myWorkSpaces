package com.oracle.aop3;

import java.lang.reflect.Proxy;

public class JdbcFactory {
	public static <T> T getMapper(Class<T>clazz) {
		T t=(T) Proxy.newProxyInstance(JdbcFactory.class.getClassLoader(),new Class[]{BookDao.class},new JdbcInvocationHandler());
		return t;
	}
}
