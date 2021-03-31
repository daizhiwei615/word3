package com.daizhiwei.controller;


import com.daizhiwei.entity.Course;
import com.daizhiwei.service.Courseservice;
import com.daizhiwei.vo.CommonResult;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CourseCnotroller {
    @Resource
    private Courseservice courseservice;

    @RequestMapping("/addcourse.do")
    @ResponseBody
    public CommonResult addcourse(Course course) {
        int rows = courseservice.addcourse(course);
        CommonResult cr = new CommonResult();
        if (rows >= 1) {
            cr.setCode(0);
            cr.setMsg("添加" + course.getCname() + "成功");
            cr.setData(course);
        } else {
            cr.setCode(1);
            cr.setMsg("添加失败");
            cr.setData("");

        }
        return cr;
    }


    @RequestMapping("/checkcourse.do")
    @ResponseBody
    public ModelAndView checkcourse(Course course) {
        Course checkcourse = courseservice.checkcourse(course.getCno());
        System.out.println("===" + checkcourse);
        ModelAndView mv = new ModelAndView();
        mv.addObject("cno", checkcourse.getCno());
        mv.addObject("cname", checkcourse.getCname());
        mv.addObject("cstartyear", checkcourse.getCstartyear());
        mv.addObject("cstartterm", checkcourse.getCstartterm());
        mv.setViewName("/Course_update.jsp");
        return mv;
    }

    @RequestMapping("/delcourse.do")
    @ResponseBody
    public ModelAndView delcourse(HttpServletRequest request) {
        String[] cnos = request.getParameterValues("cno");
        courseservice.delCourse(cnos);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Course_check.jsp");
        return mv;
    }


    @RequestMapping("/upcourse.do")
    @ResponseBody
    public CommonResult upcourse2(Course course) {
        int upcourse = courseservice.upcourse(course);
        CommonResult cr = new CommonResult();
        if (upcourse >= 1) {
            cr.setCode(0);
            cr.setMsg("修改" + course.getCname() + "成功");
            cr.setData(course);
        } else {
            cr.setCode(1);
            cr.setMsg("课程号不可修改");
            cr.setData("");

        }
        return cr;
    }

    @RequestMapping("/checkcourse4.do")
    @ResponseBody
    public CommonResult checkcourse4(HttpServletRequest request) {
        String cname = request.getParameter("cname");
        String cstartyear = request.getParameter("cstartyear");
        String cstartterm = request.getParameter("cstartterm");
        List<Course> course = courseservice.checkcourse4(cname, cstartyear, cstartterm);
        CommonResult cr = new CommonResult();
        if (course != null && course.size() > 0) {
            cr.setCode(0);
            cr.setMsg("查询出" + course.size() + "个城市");
            cr.setData(course);
        } else {
            cr.setCode(1);
            cr.setMsg("查询为0");
            cr.setData("");

        }
        return cr;
    }
}



