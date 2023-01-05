package com.project.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

//@Component
//@Aspect
public class TxAdvice {
	@Autowired 
	private PlatformTransactionManager transactionManager;
	@Pointcut("execution(* com.project.service..*Service*.*(..))")
	public void insertTx() {
		
	}
	@Around("insertTx()")
	public Object apllyTx(ProceedingJoinPoint joinpoint) throws Throwable {
		TransactionStatus transactionStatus =  transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			Object object = joinpoint.proceed();
			transactionManager.commit(transactionStatus);
			return object;
		} catch (RuntimeException e) {
			//오류상황
			transactionManager.rollback(transactionStatus);
			throw e;
		}
	}
}