package com.atcrowdfunding.manager.dao;

import com.atcrowdfunding.bean.User;
import com.sun.org.glassfish.external.probe.provider.annotations.ProbeParam;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);


    User queryUserlogin(Map<String, Object> paramMap);

    User selectByLoginacct(String loginacct);

    List<User> queryList(Map<String, Object> paramMap);

    Integer queryCount(Map<String, Object> paramMap);

//    List<User> queryList(@ProbeParam("startIndex") Integer startIndex,
//                         @ProbeParam("pagesize") Integer pagesize);
}