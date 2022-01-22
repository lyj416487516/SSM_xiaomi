package org.example.chapter03.profile;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

        context.getEnvironment().setActiveProfiles("prod");
        context.register(DataSourceConfig.class);
        context.refresh();

        context.close();
    }
}