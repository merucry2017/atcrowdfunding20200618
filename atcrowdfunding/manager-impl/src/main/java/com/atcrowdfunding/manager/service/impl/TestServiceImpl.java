package com.atcrowdfunding.manager.service.impl;

import com.atcrowdfunding.manager.dao.TestDao;
import com.atcrowdfunding.manager.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

    @Override
    public void insert() {
        Map<String,String> map = new HashMap<>();
        map.put("name","张三");
        try{
            testDao.insert(map);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
