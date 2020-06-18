package com.atcrowdfunding.manager.dao;

import com.atcrowdfunding.bean.Return;

import java.util.List;

public interface ReturnMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Return record);

    Return selectByPrimaryKey(Integer id);

    List<Return> selectAll();

    int updateByPrimaryKey(Return record);
}