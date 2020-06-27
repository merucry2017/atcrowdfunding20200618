package com.atcrowdfunding.manager.dao;

import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.bean.RolePermission;
import com.atcrowdfunding.bean.User;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    Role selectByName(String name);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    Integer queryCount(Map paramMap);

    List<Role> pageQuery(Map paramMap);

    void deleteRolePermissionRelationship(Integer roleid);

    Integer insertRolePermission(RolePermission rp);
}