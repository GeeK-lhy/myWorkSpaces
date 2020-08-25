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
		System.out.println("����һ������֪ͨ");
		//����Ŀ�����ķ��� 
		try {
			point.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("�����������");
	}
	
//	@Before("myPointcut()")
//	public void before(JoinPoint point) {
//		System.out.println(point.getSignature().getName());
//		System.out.println("����һ��ǰ�÷���---------------");
//	}
//	
//	@AfterReturning(pointcut="myPointcut()",returning="result")
//	public void returning(JoinPoint point,Object result) {
//		System.out.println("���ؽ������ǿ�����ã���������ǣ�"+point.getSignature().getName());
//		System.out.println("����ֵ��:"+result);
//	}
//	
//	@After("myPointcut()")
//	public void after() {
//		System.out.println("������ǿ``````````````````````");
//	}
}
