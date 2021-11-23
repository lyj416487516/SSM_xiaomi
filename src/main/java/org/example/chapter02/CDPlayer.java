package org.example.chapter02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.inject.Inject;

@Component
public class CDPlayer implements MediaPlayer {

    private CompactDisc compactDisc;

    /*
       通过为bean添加注解实现自动装配的三种方法
     */
    //使用在构造器上
//    @Inject//@Autowired注解也可以替换成@Inject注解（来源于Java依赖注入规范），同样可以实现自动装配
    @Autowired//通过设置require属性为false避免该异常出现@Autowired(required = false)
    public CDPlayer(CompactDisc compactDisc) {
        this.compactDisc = compactDisc;
    }

//    //使用在属性的Setter方法上
//    @Autowired
//    public void setCompactDisc(CompactDisc compactDisc) {
//        this.compactDisc = compactDisc;
//    }
//
//    //使用在类的任何方法上
//    @Autowired
//    public void insertDisc(CompactDisc compactDisc) {
//        this.compactDisc = compactDisc;
//    }

    @Override
    public void play() {
        compactDisc.play();
    }
}