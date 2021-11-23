package org.example.chapter02;

import org.springframework.context.annotation.ComponentScan;

//设置组件扫描的基础包
//@ComponentScan//这个注解能够让Spring启用组件扫描
@ComponentScan(basePackages = "org.example.chapter02")//指定要扫描的基础包（单个）basePackages = {"chapter01", "chapter02"}//指定要扫描的基础包（多个）
//@ComponentScan(basePackageClasses = {CDPlayer.class})//指定要扫描的基础包（类型安全）
public class CDPlayerConfig {
}
