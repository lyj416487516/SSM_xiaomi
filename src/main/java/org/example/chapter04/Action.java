package org.example.chapter04;

import java.lang.annotation.*;

/**
 * 在之前我们声明的切点中，切点表达式都是使用全限定类名和方法名匹配到某个具体的方法，但有时候我们需要匹配到使用某个注解的所有方法，
 * 此时就可以在切点表达式使用@annotation来实现，注意和之前在切点表达式中使用execution的区别
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Action {
    String name();
}
