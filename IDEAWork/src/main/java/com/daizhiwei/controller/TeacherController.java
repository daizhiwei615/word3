package com.daizhiwei.controller;

import com.daizhiwei.entity.Teacher;
import com.daizhiwei.service.Teacherservice;
import com.daizhiwei.vo.CommonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TeacherController {
    @Resource
    private Teacherservice teacherservice;
    @RequestMapping("/checkteacher.do")
    @ResponseBody
    public CommonResult checkteacher() {
        List<Teacher> teacherList = teacherservice.checkteacher();
        CommonResult cr = new CommonResult(1, "查询没有结果", "");
        if (teacherList != null && teacherList.size() > 0) {
            cr = new CommonResult(0, "查询成功",teacherList);
        }
        return cr;
    }

    @RequestMapping("/checkteacher2.do")
    @ResponseBody
    public CommonResult checkteacherview(HttpServletRequest request){
        String Tname = request.getParameter("Tname");
        String Tage = request.getParameter("Tage");
        String Tid = request.getParameter("Tid");
        List<Teacher> checkteacher = teacherservice.checkteacher(Tname, Tage);
        CommonResult cr = new CommonResult();
        if (checkteacher != null && checkteacher.size() > 0) {
            cr.setCode(0);
            cr.setMsg("查询出" + checkteacher.size() + "个结果");
            cr.setData(checkteacher);
        } else {
            cr.setCode(1);
            cr.setMsg("查询为0");
            cr.setData("");

        }
        return cr;
    }

    @RequestMapping("/addteacher.do")
    @ResponseBody
    public CommonResult addteacher(HttpServletRequest request, Teacher teacher) {
        String Tid=request.getParameter("Tid");
        String Tname = request.getParameter("Tname");
        String Tage = request.getParameter("Tage");
        List<Teacher> checkteacher = teacherservice.checkteacher(Tname, Tage);
        CommonResult cr = new CommonResult();
        if (checkteacher != null && checkteacher.size() > 0) {
            cr.setCode(0);
            cr.setMsg("该老师信息已经添加!");
            cr.setData("");
        } else {
            Teacher teacher1 = teacherservice.checkteacher2(Integer.parseInt(Tid));
            if (teacher1 !=null){
                cr.setCode(0);
                cr.setMsg("该编号已经存在了!");
                cr.setData("");
            }
            else {
                int addteacher = teacherservice.addteacher(teacher);
                cr.setCode(1);
                cr.setMsg("添加" + teacher.getTname()+ "成功");
                cr.setData(teacher);
            }


        }
        return cr;
    }

    @RequestMapping("/delteacher.do")
    @ResponseBody
    public ModelAndView delcourse(HttpServletRequest request) {
        String[] Tids = request.getParameterValues("Tid");
       teacherservice.delteacher(Tids);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Teacher_check.jsp");
        return mv;
    }

    @RequestMapping("/checkteacher3.do")
    @ResponseBody
    public ModelAndView checkteacher2(Teacher teacher) {
        Teacher teacher1 = teacherservice.checkteacher2(teacher.getTid());
        ModelAndView mv = new ModelAndView();
        mv.addObject("Tid", teacher1.getTid());
        mv.addObject("Tname",teacher1.getTname());
        mv.addObject("Tage",teacher1.getTage());
        mv.setViewName("/Teacher_update.jsp");
        return mv;
    }
    @RequestMapping("/upteacher.do")
    @ResponseBody
    public CommonResult upclassroom(Teacher teacher) {
        Teacher teacher1 = teacherservice.checkteacher2(teacher.getTid());
        List<Teacher> checkteacher = teacherservice.checkteacher(teacher.getTname(), teacher.getTage());
        CommonResult cr = new CommonResult();
        if (teacher1 ==null){
            cr.setCode(0);
            cr.setMsg("编号不存在!");
            cr.setData("");
        }
        else {
            if (checkteacher != null && checkteacher.size() > 0) {
                cr.setCode(0);
                cr.setMsg("该老师信息已经存在!");
                cr.setData("");
            } else {
                   int updateteacher = teacherservice.updateteacher(teacher);
                    cr.setCode(1);
                    cr.setMsg("修改" + teacher.getTname()+ "成功");
                    cr.setData(teacher);
        }
        }
        return cr;
    }
}
