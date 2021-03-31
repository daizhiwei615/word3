package com.daizhiwei.handler;

import com.daizhiwei.entity.Student;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URL
        System.out.println("===============开始执行登录拦截器");
        String url = request.getRequestURI();
        // URL:除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("/login")>=0){
            return true;
        }
        // 获取Session
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("USER_SESSION");
        System.out.println("==="+student);
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if(student != null){
            return true;
        }
        // 不符合条件的给出提示信息，并转发到登录页面
        request.setAttribute("msg", "您还没有登录，请先登录！");
        System.out.println("6666=====");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return false;
    }

    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}


