package org.example.shopping.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TransactionManager {

    @Before("execution(* org.example.shopping.service.Impl.IndexServiceImpl.classFindAll())")
    public void beforeContext() {
        System.out.println("classify start");
    }

    @After("execution(* org.example.shopping.service.Impl.IndexServiceImpl.classFindAll())")
    public void afterContext() {
        System.out.println("classify end");
    }

    @AfterThrowing("execution(* org.example.shopping.service.Impl.IndexServiceImpl.classFindAll())")
    public void error() {
        System.out.println("error");
    }

}
