package com.atcrowdfunding.manager.service;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.util.Page;
import com.atcrowdfunding.vo.Data;

import java.util.List;
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

    Integer saveUserRoleRelationship(Integer userid, Data data);

    Integer deleteUserRoleRelationship(Integer userid, Data data);

    List<Role> queryAllRole();

    List<Integer> queryRoleByUserid(Integer id);

    List<Permission> queryPermissionByUserid(Integer id);
}
