package org.example.chapter03.el;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Configuration
@ComponentScan
@PropertySource("classpath:org/example/chapter03/el/test.properties")
public class ExpressiveConfig {

    @Autowired
    private Book book;

    @Autowired
    private Environment environment;

    @Value("#{systemProperties['os.name']}")
    private String osName;

    //SpEL表达式要放到“#{......}”之中，而之前讲到的属性占位符是放到“${......}”之中
    @Value("#{demoService.another}")
//    @Value("#{demoService.getAnother()}")//输出结果不变，只是从调用属性变成了调用方法
//    @Value("#{demoService.getAnother()?.toUpperCase()}")//使用"?."运算符，是为了避免当demoService.getAnother()返回null时，代码出现NullPointerException
    private String fromAnother;

//    @Value("#{T(java.lang.Math).random()}")//这里使用T()引用了java.lang.Math类，然后调用了它的静态方法random()
    @Value("#{T(java.lang.Math).random() * 100.0}")
    private double randomNumber;

    @Value("#{book.getBookName() + ' write by ' + book.getBookAuthor()}")
    private String bookDescr;

    @Value("#{systemProperties['os.name'] == 'Windows 10'?'Windows':'Linux'}")
    private String osType;

    public void outputResource() {
        //新建的test.properties和test.txt文件并没有被编译到target目录下
//        可以在pom.xml中添加
//        <build>
//            <resources>
//                <resource>
//                    <directory>src/main/java</directory>
//                    <includes>
//                        <include>**/*.txt</include>
//                        <include>**/*.properties</include>
//                    </includes>
//                </resource>
//            </resources>
//        </build>

        System.out.println("book.name:" + environment.getProperty("book.name"));
        System.out.println("book.author:" + environment.getProperty("book.author"));
        String workCity = environment.getProperty("author.workcity","上海");
//        String workCity = environment.getRequiredProperty("author.workcity");属性值不存在抛出异常
        Integer authorAge = environment.getProperty("author.age", Integer.class);
        boolean isMan = environment.getProperty("author.isMan", Boolean.class, true);
        System.out.println("author.isMan:" + isMan);
        System.out.println("author.age:" + authorAge);
        System.out.println("author.workcity:" + workCity);
        System.out.println("----------------------------");

        //属性占位符
        System.out.println("book.name:" + book.getBookName());
        System.out.println("book.author:" + book.getBookAuthor());
        System.out.println("----------------------------");

        //Spring表达式
        System.out.println("os.name:" + osName);
        System.out.println("demoService.another:" + fromAnother);
        System.out.println("randomNumber:" + randomNumber);
        System.out.println("bookDescr:" + bookDescr);
        System.out.println("osType:" + osType);

    }
}