package com.daizhiwei.controller;


import com.daizhiwei.entity.Student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudentController {
         //调用Service
    @RequestMapping(value="/login2.do")
    public String toLogin() {
        return "login";
    }
    /**
     * 用户登录
     */
    @RequestMapping(value="/login.do")
    public String login(Student student, Model model, HttpSession session) {
        // 获取用户名和密码
        String username = student.getUsername();
        String password = student.getPassword();
        // 此处模拟从数据库中获取用户名和密码后进行判断
        if(username != null && username.equals("123")
                && password != null && password.equals("1234")){
            // 将用户对象添加到Session
            session.setAttribute("USER_SESSION", student);
            // 重定向到主页面的跳转方法
            return "redirect:main.do";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "login";
    }
    /**
     * 向用户主页面跳转
     */
    @RequestMapping(value="/main.do")
    public String toMain() {
        return "main";
    }
    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:login2.do";
    }

}


