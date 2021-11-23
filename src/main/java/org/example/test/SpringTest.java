package org.example.test;

import org.example.dao.Author;
import org.example.dao.TestDao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest {

    @Test
    public void test() {
        //初始化Spring容器ApplicationContext，加载配置文件
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
        TestDao testDao= applicationContext.getBean("testDao" , TestDao.class);//此处通过applicationContext.xml文件中的bean-id创建对象
        testDao.sayHello();
        testDao.printBookInfo();

        Author author= applicationContext.getBean("author" , Author.class);
        author.printAuthorInfo();
    }

}
