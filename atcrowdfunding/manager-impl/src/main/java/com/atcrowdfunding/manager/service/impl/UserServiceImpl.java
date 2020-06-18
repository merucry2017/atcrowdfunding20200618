package com.atcrowdfunding.manager.service.impl;

import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.exception.LoginFailException;
import com.atcrowdfunding.manager.dao.UserMapper;
import com.atcrowdfunding.manager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryUserlogin(Map<String, Object> paramMap) {

        User user = userMapper.queryUserlogin(paramMap);
        if(user==null){
            throw new LoginFailException("用户账号或密码不正确");
        }
        return user;
    }
}
