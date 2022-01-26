package org.example.chapter04;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 1)切面使用了@Component注解，以便Spring能自动扫描到并创建为bean，如果这里不添加该注解，也可以通过Java配置或者xml配置的方式将该切面声明为一个bean，否则切面不会生效。
 *
 * 2)@Pointcut("@annotation(chapter04.Action)")，这里我们在定义切点时使用了@annotation来指定某个注解，而不是之前使用execution来指定某些或某个方法。
 *
 * 我们之前使用的切面表达式是execution(* chapter04.concert.Performance.perform(..))是匹配到某个具体的方法，如果想匹配到某些方法，可以修改为如下格式：
 */
@Aspect
@Component
public class LogAspect {
    @Pointcut("@annotation(org.example.chapter04.Action)")
    public void annotationPointCut() {
    }

    @After("annotationPointCut()")
    public void after(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        Action action = method.getAnnotation(Action.class);
        System.out.println("注解式拦截 " + action.name());
    }
}