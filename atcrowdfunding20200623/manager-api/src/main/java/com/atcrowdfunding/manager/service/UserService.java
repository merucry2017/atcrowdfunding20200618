package com.atcrowdfunding.manager.service;

import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.util.Page;

import java.util.Map;

public interface UserService {
    User queryUserlogin(Map<String, Object> paramMap);

    Integer saveUser(User user);

//    Page queryPage(Integer pageno, Integer pagesize);

    Page queryPage(Map<String, Object> paramMap);

    User getUserById(Integer id);

    Integer updateUser(User user);

    Integer deleteUser(Integer id);

    Integer deleteBatchUser(Integer[] id);
}
