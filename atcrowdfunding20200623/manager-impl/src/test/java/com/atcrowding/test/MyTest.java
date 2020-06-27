package com.atcrowding.test;

import com.atcrowdfunding.manager.service.TestService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    @Test
    public void test(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring-context.xml");
        TestService testService = ac.getBean("testServiceImpl", TestService.class);
        testService.insert();
    }
}
