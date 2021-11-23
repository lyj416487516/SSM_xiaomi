package org.example.chapter02.javaconfig;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CDPlayerTest {

    @Test
    public void test() {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(CDPlayerConfig.class);
        CompactDisc compactDisc = (SgtPeppers) applicationContext.getBean("lonelyHeartsClub");
        compactDisc.play();

        CDPlayer cdPlayer = applicationContext.getBean(CDPlayer.class);
        cdPlayer.play();
    }
}