package com.atcrowdfunding.manager.service.impl;

import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.bean.RolePermission;
import com.atcrowdfunding.manager.dao.RoleMapper;
import com.atcrowdfunding.manager.service.RoleService;
import com.atcrowdfunding.util.Page;
import com.atcrowdfunding.vo.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Page pageQuery(Map paramMap) {
        Page rolePage = new Page((Integer) paramMap.get("pageno"), (Integer) paramMap.get("pagesize"));

        Integer startIndex = rolePage.getStartIndex();
        paramMap.put("startIndex", startIndex);
        List<Role> datas = roleMapper.pageQuery(paramMap);
        rolePage.setDatas(datas);

        Integer totalsize = roleMapper.queryCount(paramMap);
        rolePage.setTotalsize(totalsize);

        return rolePage;
    }

    @Override
    public Integer deleteRole(Integer id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Integer saveRolePermissionRelationship(Integer roleid, Data datas) {
        roleMapper.deleteRolePermissionRelationship(roleid);

        int totalCount = 0;
        List<Integer> ids = datas.getIds();
        for (Integer permissionid : ids) {
            RolePermission rp = new RolePermission();
            rp.setRoleid(roleid);
            rp.setPermissionid(permissionid);
            int count = roleMapper.insertRolePermission(rp);
            totalCount += count;
        }
        return totalCount;
    }

    @Override
    public Integer saveRole(Role role) {
        Role result = roleMapper.selectByName(role.getName());
        if(result!=null){
            throw new RuntimeException("该角色已经存在！请勿重复增加！");
        }
        return roleMapper.insert(role);
    }

    @Override
    public Integer deleteBatchRole(Integer[] ids) {
        int totalCount = 0;
        for (Integer id: ids){
            int count = roleMapper.deleteByPrimaryKey(id);
            totalCount += count;
        }
        if(totalCount!=ids.length){
            throw new RuntimeException("批量删除失败");
        }
        return totalCount;
    }

    @Override
    public Role getRoleById(Integer id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateRole(Role role) {
        return roleMapper.updateByPrimaryKey(role);
    }
}
