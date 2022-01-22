package org.example.chapter03.profile;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;

@Configuration
@Profile("dev")
/**
 * 开发环境
 */
public class DevDataSourceConfig {
    @Bean
    public DataSource devDataSource() {
        System.out.println("This is dev DataSource");

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        basicDataSource.setUrl("jdbc:mysql://localhost:3306/practice?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8");
        basicDataSource.setUsername("dev");
        basicDataSource.setPassword("dev");

        return basicDataSource;
    }
}