package com.oracle.advice;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
@Component
@Aspect
@Order(1)
public class MyAdvice2 {
//	@Pointcut("execution(* com.oracle.vo.*.*(..)) || execution(* com.oracle.dao.*.*(..))")
//	private void myPointcut() {}
//	@Before("myPointcut()")
//	public void before2() {
//		System.out.println("Advice2  --------------");
//	}
}
