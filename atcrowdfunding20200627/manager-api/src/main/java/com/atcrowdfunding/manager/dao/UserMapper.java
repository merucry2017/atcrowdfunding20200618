package com.atcrowdfunding.manager.dao;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.vo.Data;
import com.sun.org.glassfish.external.probe.provider.annotations.ProbeParam;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.apache.ibatis.annotations.Param;

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

    Integer saveUserRoleRelationship( @Param("userid") Integer userid,  @Param("data") Data data);

    Integer deleteUserRoleRelationship(Integer userid, Data data);

    List<Role> queryAllRole();

    List<Integer> queryRoleByUserid(Integer id);

    List<Permission> queryPermissionByUserid(Integer id);

//    List<User> queryList(@ProbeParam("startIndex") Integer startIndex,
//                         @ProbeParam("pagesize") Integer pagesize);
}