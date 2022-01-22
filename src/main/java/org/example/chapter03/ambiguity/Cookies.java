package org.example.chapter03.ambiguity;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary//在同事多个自动化装配bean后是使用默认首选
public class Cookies implements Dessert {
    @Override
    public void showName() {
        System.out.println("饼干");
    }
}