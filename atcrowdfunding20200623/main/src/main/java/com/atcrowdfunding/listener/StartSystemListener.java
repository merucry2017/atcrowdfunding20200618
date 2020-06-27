package com.atcrowdfunding.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartSystemListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /**
        * 将项目上下文路径request.getContextPath()放置到application域中
        */
        ServletContext application = sce.getServletContext();
        String contextPath = application.getContextPath();
        application.setAttribute("APP_PATH", contextPath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }


}
