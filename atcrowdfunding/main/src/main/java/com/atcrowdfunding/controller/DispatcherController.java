package com.atcrowdfunding.controller;

import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.manager.service.MemberService;
import com.atcrowdfunding.manager.service.UserService;
import com.atcrowdfunding.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class DispatcherController {

    @Autowired
    private UserService userService;

    @Autowired
    private MemberService memberService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

    @RequestMapping("/doLogin")
    public String doLogin(String loginacct, String userpswd, String type, HttpSession session) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("loginacct", loginacct);
        paramMap.put("userpswd", userpswd);
        paramMap.put("type", type);

        User user = userService.queryUserlogin(paramMap);

        session.setAttribute(Const.LOGIN_USER, user);

        return "redirect:/main.htm";
    }
}
