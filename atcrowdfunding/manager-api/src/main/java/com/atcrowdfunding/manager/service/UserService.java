package com.atcrowdfunding.manager.service;

import com.atcrowdfunding.bean.User;

import java.util.Map;

public interface UserService {
    User queryUserlogin(Map<String, Object> paramMap);
}
