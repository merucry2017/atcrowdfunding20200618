package com.atcrowdfunding.manager.service;

import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.util.Page;
import com.atcrowdfunding.vo.Data;

import java.util.Map;

public interface RoleService {
    Page pageQuery(Map paramMap);

    Integer deleteRole(Integer id);

    Integer saveRolePermissionRelationship(Integer roleid, Data datas);

    Integer saveRole(Role role);

    Integer deleteBatchRole(Integer[] id);

    Role getRoleById(Integer id);

    Integer updateRole(Role role);
}
