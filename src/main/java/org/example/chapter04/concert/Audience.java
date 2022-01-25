package org.example.chapter04.concert;

import org.aspectj.lang.annotation.*;

/**
 * 观众
 * 使用@Aspect注解定义为切面
 * @Aspect注解表明Audience类是一个切面。
 */
@Aspect
public class Audience {
//    /**
//     * 表演之前,观众就座
//     * @Before：该注解用来定义前置通知，通知方法会在目标方法调用之前执行
//     * execution：在方法执行时触发
//     * *：表明我们不关心方法返回值的类型，即可以是任意类型
//     * chapter04.concert.Performance.perform：使用全限定类名和方法名指定要添加前置通知的方法
//     * (..)：方法的参数列表使用(..)，表明我们不关心方法的入参是什么，即可以是任意类型
//     */
//    @Before("execution(* org.example.chapter04.concert.Performance.perform(..))")
//    public void takeSeats() {
//        System.out.println("Taking seats");
//    }
//
//    /**
//     * 表演之前,将手机调至静音
//     */
//    @Before("execution(* org.example.chapter04.concert.Performance.perform(..))")
//    public void silenceCellPhones() {
//        System.out.println("Silencing cell phones");
//    }
//
//    /**
//     * 表演结束,不管表演成功或者失败
//     * @After注解用来定义后置通知，通知方法会在目标方法返回或者抛出异常后调用
//     */
//    @After("execution(* org.example.chapter04.concert.Performance.perform(..))")
//    public void finish() {
//        System.out.println("perform finish");
//    }
//
//    /**
//     * 表演之后,鼓掌
//     * @AfterReturning注解用来定义返回通知，通知方法会在目标方法返回后调用
//     */
//    @AfterReturning("execution(* org.example.chapter04.concert.Performance.perform(..))")
//    public void applause() {
//        System.out.println("CLAP CLAP CLAP!!!");
//    }
//
//    /**
//     * 表演失败之后,观众要求退款
//     * @AfterThrowing注解用来定义异常通知，通知方法会在目标方法抛出异常后调用
//     */
//    @AfterThrowing("execution(* org.example.chapter04.concert.Performance.perform(..))")
//    public void demandRefund() {
//        System.out.println("Demanding a refund");
//    }

    /**
     * 可复用的切点
     * 上 面定义的5个切点中，切点表达式都是一样的，这显然是不好的，可以使用@Pointcut注解来定义可重复使用的切点表达式
     */
    @Pointcut("execution(* org.example.chapter04.concert.Performance.perform(..))")
    public void perform() {
    }

    /**
     * 表演之前,观众就座
     */
    @Before("perform()")
    public void takeSeats() {
        System.out.println("Taking seats");
    }

    /**
     * 表演之前,将手机调至静音
     */
    @Before("perform()")
    public void silenceCellPhones() {
        System.out.println("Silencing cell phones");
    }

    /**
     * 表演结束,不管表演成功或者失败
     */
    @After("perform()")
    public void finish() {
        System.out.println("perform finish");
    }

    /**
     * 表演之后,鼓掌
     */
    @AfterReturning("perform()")
    public void applause() {
        System.out.println("CLAP CLAP CLAP!!!");
    }

    /**
     * 表演失败之后,观众要求退款
     */
    @AfterThrowing("perform()")
    public void demandRefund() {
        System.out.println("Demanding a refund");
    }

}