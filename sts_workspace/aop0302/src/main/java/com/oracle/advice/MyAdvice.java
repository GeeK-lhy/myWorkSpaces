package com.oracle.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Aspect
@Order(3)
public class MyAdvice {
	@Pointcut("execution(* com.oracle.vo.*.*(..)) || execution(* com.oracle.dao.*.*(..))")
	private void myPointcut() {}
	
	@Around("myPointcut()")
	public void around(ProceedingJoinPoint point) {
		System.out.println("这是一个环绕通知");
		//调用目标对象的方法 
		try {
			point.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("方法调用完毕");
	}
	
//	@Before("myPointcut()")
//	public void before(JoinPoint point) {
//		System.out.println(point.getSignature().getName());
//		System.out.println("这是一个前置方法---------------");
//	}
//	
//	@AfterReturning(pointcut="myPointcut()",returning="result")
//	public void returning(JoinPoint point,Object result) {
//		System.out.println("返回结果的增强被调用，这个方法是："+point.getSignature().getName());
//		System.out.println("返回值是:"+result);
//	}
//	
//	@After("myPointcut()")
//	public void after() {
//		System.out.println("后置增强``````````````````````");
//	}
}
