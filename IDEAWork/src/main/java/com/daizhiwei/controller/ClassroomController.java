package com.daizhiwei.controller;

import com.daizhiwei.entity.Classroom;
import com.daizhiwei.service.Classroomservice;
import com.daizhiwei.vo.CommonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ClassroomController {
    @Resource
    private Classroomservice classroomservice;
    @RequestMapping("/checkclassroom.do")
    @ResponseBody
    public CommonResult checkcourseroomview(HttpServletRequest request){
        String room = request.getParameter("room");
        String house = request.getParameter("house");
        String cid = request.getParameter("cid");
        List<Classroom> checkclassroom = classroomservice.checkclassroom(house, room);
        CommonResult cr = new CommonResult();
        if (checkclassroom != null && checkclassroom.size() > 0) {
            cr.setCode(0);
            cr.setMsg("查询出" + checkclassroom.size() + "个结果");
            cr.setData(checkclassroom);
        } else {
            cr.setCode(1);
            cr.setMsg("查询为0");
            cr.setData("");

        }
        return cr;
    }

    @RequestMapping("/addclassroom.do")
    @ResponseBody
    public CommonResult addcourse(HttpServletRequest request, Classroom classroom) {
        String cid = request.getParameter("cid");
        String house = request.getParameter("house");
        String room = request.getParameter("room");
        List<Classroom> checkclassroom = classroomservice.checkclassroom(house, room);
        CommonResult cr = new CommonResult();
        if (checkclassroom != null && checkclassroom.size() > 0) {
            cr.setCode(0);
            cr.setMsg("该教学楼已经存在这课室");
            cr.setData("");
        } else {
            Classroom classroom1 = classroomservice.checkclassroom2(Integer.parseInt(cid));
            if (classroom1 !=null){
                cr.setCode(0);
                cr.setMsg("该编号已经存在");
                cr.setData("");
            }
            else {
                int addclassroom = classroomservice.addclassroom(classroom);
                cr.setCode(1);
                cr.setMsg("添加" + classroom.getHouse()+classroom.getRoom() + "成功");
                cr.setData(classroom);
            }


        }
        return cr;
    }
    @RequestMapping("/delclassroom.do")
    @ResponseBody
    public ModelAndView delcourse(HttpServletRequest request) {
        String[] cids = request.getParameterValues("cid");
        classroomservice.delclassroom(cids);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/classroom_check.jsp");
        return mv;
    }
    @RequestMapping("/checkclassroom2.do")
    @ResponseBody
    public ModelAndView checkclassroom2(Classroom classroom) {
        Classroom classroom1 = classroomservice.checkclassroom2(classroom.getCid());
        ModelAndView mv = new ModelAndView();
        mv.addObject("cid", classroom1.getCid());
        mv.addObject("house", classroom1.getHouse());
        mv.addObject("room", classroom1.getRoom());
        mv.setViewName("/Classroom_update.jsp");
        return mv;
    }
    @RequestMapping("/upclassroom.do")
    @ResponseBody
    public CommonResult upclassroom(Classroom classroom) {
        Classroom classroom2 = classroomservice.checkclassroom2(classroom.getCid());
        CommonResult cr = new CommonResult();
        if (classroom2==null){
            cr.setCode(0);
            cr.setMsg("编号不存在！");
            cr.setData("");
        }
        else {
            List<Classroom> classroom1 =  classroomservice.checkclassroom(classroom.getHouse(),classroom.getRoom());
            if (classroom1 != null && classroom1.size() > 0) {
                cr.setCode(0);
                cr.setMsg("已经存在该课室了" );
                cr.setData("");
            }
            else {
                int updateclassroom = classroomservice.updateclassroom(classroom);
                cr.setCode(1);
                cr.setMsg("修改"+classroom.getHouse()+classroom.getRoom());
                cr.setData(classroom);
            }
        }
        return cr;
    }
    }

