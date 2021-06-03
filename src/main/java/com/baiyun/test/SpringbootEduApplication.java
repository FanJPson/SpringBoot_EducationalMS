package com.baiyun.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.baiyun.test.mapper")
public class SpringbootEduApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootEduApplication.class, args);
    }

}
