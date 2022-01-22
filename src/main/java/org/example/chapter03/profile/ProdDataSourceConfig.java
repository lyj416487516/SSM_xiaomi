package org.example.chapter03.profile;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;

@Configuration
@Profile("prod")
/**
 * 生产环境
 */
public class ProdDataSourceConfig {
    @Bean
    public DataSource prodDataSource() {
        System.out.println("This is prod DataSource");

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        basicDataSource.setUrl("jdbc:mysql://localhost:3306/practice?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8");
        basicDataSource.setUsername("prod");
        basicDataSource.setPassword("prod");

        return basicDataSource;
    }
}