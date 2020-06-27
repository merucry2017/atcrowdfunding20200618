package com.atcrowdfunding.manager.controller;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.controller.BaseController;
import com.atcrowdfunding.manager.service.PermissionService;
import com.atcrowdfunding.manager.service.RoleService;
import com.atcrowdfunding.util.AjaxResult;
import com.atcrowdfunding.util.Page;
import com.atcrowdfunding.util.StringUtil;
import com.atcrowdfunding.vo.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/index")
    public String index(){
        return "role/index";
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "role/add";
    }

    @ResponseBody
    @RequestMapping("/doAdd")
    public Object doAdd(Role role){
        AjaxResult result = new AjaxResult();

        try {
            int count = roleService.saveRole(role);

            result.setSuccess(count==1);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("添加数据失败!");
        }
        return result; //将对象序列化为JSON字符串,以流的形式返回.
    }

    @RequestMapping("/assignPermission")
    public String assignPermission(){
//        Map<String, Integer> param = new HashMap<>();
//        param.put("roleid",id);
        return "role/assignPermission";
    }

    @ResponseBody
    @RequestMapping("/loadDataAsync")
    public Object loadDataAsync(Integer roleid){

        List<Permission> root = new ArrayList<Permission>();

        List<Permission> childredPermissons =  permissionService.queryAllPermission();

        //根据角色id查询该角色之前所分配过的许可.
        List<Integer> permissonIdsForRoleid = permissionService.queryPermissionidsByRoleid(roleid);
        Map<Integer, Permission> map = new HashMap<Integer, Permission>();

        for (Permission innerpermission  : childredPermissons) {
            map.put(innerpermission.getId(), innerpermission );
            if (permissonIdsForRoleid.contains(innerpermission.getId())){
                innerpermission.setChecked(true);
            }
        }

        for (Permission permission : childredPermissons) {
            //通过子查找父
            //子菜单
            Permission child = permission ; //假设为子菜单
            if(child.getPid() == 0){
                root.add(permission);
            }else{
                //父节点
                Permission parent = map.get(child.getPid());
                parent.getChildren().add(child);
            }
        }
        return root;
    }

    @ResponseBody
    @RequestMapping("/doAssignPermission")
    public Object doAssignPermission(Integer roleid, Data datas){
        AjaxResult result = new AjaxResult();
        try {
            int count = roleService.saveRolePermissionRelationship(roleid, datas);

            result.setSuccess(count == datas.getIds().size());
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("分配角色数据失败!");
        }

        return result; //将对象序列化为JSON字符串,以流的形式返回.
    }

    //条件查询
    @ResponseBody
    @RequestMapping("/pageQuery")
    public Object pageQuery(@RequestParam(value = "pageno", required = false, defaultValue = "1") Integer pageno,
                        @RequestParam(value = "pagesize", required = false, defaultValue = "10") Integer pagesize,
                        String queryText){
        AjaxResult result = new AjaxResult();
        try {

            Map paramMap = new HashMap();
            paramMap.put("pageno", pageno);
            paramMap.put("pagesize", pagesize);

            if (StringUtil.isNotEmpty(queryText)){
                if (queryText.contains("%")){
                    queryText = queryText.replaceAll("%", "\\\\%");
                }
                paramMap.put("queryText", queryText);
            }
            Page rolePage = roleService.pageQuery(paramMap);

            result.setSuccess(true);
            result.setPage(rolePage);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败!");
        }

        return result; //将对象序列化为JSON字符串,以流的形式返回.
    }

    @ResponseBody
    @RequestMapping("/doDelete")
    public Object doDelete(Integer id){
        AjaxResult result = new AjaxResult();
        try {
            int count = roleService.deleteRole(id);

            result.setSuccess(count == 1);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("删除数据失败!");
        }

        return result; //将对象序列化为JSON字符串,以流的形式返回.
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Integer id,Map<String, Object> map){

        Role role = roleService.getRoleById(id);

        map.put("role",role);

        return "role/update";
    }

    @ResponseBody
    @RequestMapping("/doUpdate")
    public Object doUpdate(Role role){
        AjaxResult result = new AjaxResult();
        try {
            int count = roleService.updateRole(role);
            result.setSuccess(count==1);
        }catch (Exception e){
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("修改数据失败");
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/doDeleteBatch")
    public Object doDeleteBatch(Integer[] id){
        AjaxResult result = new AjaxResult();
        try {
            int count = roleService.deleteBatchRole(id);
            result.setSuccess(count==1);
        }catch (Exception e){
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("删除数据失败");
        }
        return result;
    }



}
