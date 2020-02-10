package com.twf.web.controller;

import com.twf.pojo.AJAXResult;
import com.twf.pojo.User;
import com.twf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 个人用户信息：controller
 * @author TWF
 *@Date2019年5月10日
 */
@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private IUserService userServiceImpl;
    
    
    // 异步AJAX，登录验证
    @ResponseBody
    @RequestMapping("/AJAXLogin")
    public Object AJAXLogin(User user, HttpSession session) {
        AJAXResult result = new AJAXResult();
        User dbuser = userServiceImpl.selectByUser(user);
        if (dbuser != null &&dbuser.getGroup()==user.getGroup()) {// 验证成功
        	
            result.setSuccess(true);
            session.setAttribute("LoginUser", dbuser);
            session.setMaxInactiveInterval(10*60);//设置session超时时间
        } else {
            result.setSuccess(false);
        }
        return result;
    }
    
   
    
    // 跳转到登录页面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }
    // 跳转到注册页面
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    // 转到主页面
    @RequestMapping("/main")
    public String main() {
        return "main";
    }
}
