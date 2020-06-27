package com.atcrowdfunding.listener;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.manager.service.PermissionService;
import com.atcrowdfunding.util.Const;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class StartSystemListener implements ServletContextListener {


    @Override
    //在服务器启动时,创建application对象时需要执行的方法.
    public void contextInitialized(ServletContextEvent sce) {
        /**
        * 将项目上下文路径request.getContextPath()放置到application域中
        */
        ServletContext application = sce.getServletContext();
        String contextPath = application.getContextPath();
        application.setAttribute("APP_PATH", contextPath);

        /**
         *  加载所有许可路径
         */
        ApplicationContext ioc = WebApplicationContextUtils.getWebApplicationContext(application);
        PermissionService permissionService = ioc.getBean(PermissionService.class);
        List<Permission> queryAllPermission = permissionService.queryAllPermission();

        Set<String> allURIs = new HashSet<String>();
        for (Permission permission : queryAllPermission) {
            allURIs.add("/" + permission.getUrl());
        }
        application.setAttribute(Const.ALL_PERMISSION_URI, allURIs);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }


}
