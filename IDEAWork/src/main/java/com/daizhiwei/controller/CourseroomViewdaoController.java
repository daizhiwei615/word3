package com.daizhiwei.controller;


import com.daizhiwei.entity.Courseroom;
import com.daizhiwei.entity.CourseroomView;
import com.daizhiwei.service.CourseroomService;
import com.daizhiwei.service.CourseroomViewService;
import com.daizhiwei.vo.CommonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CourseroomViewdaoController {
@Resource
    private CourseroomViewService courseroomViewService;
    @Resource
    private CourseroomService courseroomService;
@RequestMapping("/checkcourseroom.do")
    @ResponseBody
    public CommonResult checkcourseroomview(HttpServletRequest request){
    String cname = request.getParameter("cname");
    String house = request.getParameter("house");
    String cstartyear = request.getParameter("cstartyear");
    String cstartterm = request.getParameter("cstartterm");
    List<CourseroomView> courseroomViewList = courseroomViewService.checkCourseroomViewdao(cname,house,cstartyear, cstartterm);
    System.out.printf(""+courseroomViewList);
    CommonResult cr = new CommonResult();
    if (courseroomViewList != null && courseroomViewList.size() > 0) {
        cr.setCode(0);
        cr.setMsg("查询出" + courseroomViewList.size() + "个城市");
        cr.setData(courseroomViewList);
    } else {
        cr.setCode(1);
        cr.setMsg("查询为0");
        cr.setData("");

    }
    return cr;
}

    @RequestMapping("/addcourseroom.do")
    @ResponseBody
    public CommonResult addcourse(HttpServletRequest request, Courseroom courseroom) {

        String cid = request.getParameter("cid");
        String week = request.getParameter("week");
        List<Courseroom> courserooms = courseroomService.checkCourseroom(Integer.parseInt(cid), week);
        CommonResult cr = new CommonResult();
        if (courserooms!= null && courserooms.size() > 0){
            cr.setCode(1);
            cr.setMsg("本课室在本时间段已经安排课程了");
            cr.setData("");
        }
        else {
            int rows = courseroomService.addcourseroom(courseroom);
            cr.setCode(0);
            cr.setMsg("添加课程号" +courseroom.getCno() +"在课室号"+courseroom.getCid()+"在"+courseroom.getWeek()+"成功");
            cr.setData(courseroom);

        }
        return cr;
    }
    @RequestMapping("/checkcourseroom2.do")
    @ResponseBody
    public ModelAndView checkcourseroom2(Courseroom courseroom) {
        Courseroom courseroom1 = courseroomService.checkcourseroom2(courseroom.getId());
        System.out.println("===" + courseroom1);
        ModelAndView mv = new ModelAndView();
        mv.addObject("id",courseroom1.getId());
        mv.addObject("cno",courseroom1.getCno());
        mv.addObject("Tid",courseroom1.getTid());
        mv.addObject("cid",courseroom1.getCid());
        mv.addObject("week",courseroom1.getWeek());
        mv.addObject("starttime",courseroom1.getStarttime());
        mv.addObject("lasttime",courseroom1.getLasttime());
        mv.setViewName("/Courseroom_update.jsp");
        return mv;
    }
    @RequestMapping("/checkcourseroom3.do")
    @ResponseBody
    public ModelAndView checkcourseroom3(CourseroomView courseroomView) {
        CourseroomView courseroomView1 = courseroomViewService.checkcourseroomview2(courseroomView.getId());
        System.out.println("===" + courseroomView1);
        ModelAndView mv = new ModelAndView();
        mv.addObject("id",courseroomView1.getId());
        mv.addObject("cname",courseroomView1.getCname());
        mv.addObject("cno",courseroomView1.getCno());
        mv.addObject("Tid",courseroomView1.getTid());
        mv.addObject("Tname",courseroomView1.getTname());
        mv.addObject("cid",courseroomView1.getCid());
        mv.addObject("houseroom",courseroomView1.getHouse()+courseroomView1.getRoom());
        mv.addObject("week",courseroomView1.getWeek());
        mv.addObject("starttime",courseroomView1.getStarttime());
        mv.addObject("lasttime",courseroomView1.getLasttime());
        mv.setViewName("/Courseroom_update.jsp");
        return mv;
    }

    @RequestMapping("/upcourseroom.do")
    @ResponseBody
    public CommonResult upcourseroom(HttpServletRequest request, Courseroom courseroom) {

        String cid = request.getParameter("cid");
        String week = request.getParameter("week");
        List<Courseroom> courserooms = courseroomService.checkCourseroom(Integer.parseInt(cid), week);
        CommonResult cr = new CommonResult();
        if (courserooms!= null && courserooms.size() > 0){
            cr.setCode(1);
            cr.setMsg("本课室在本时间段已经安排课程了");
            cr.setData("");
        } else {
            int updatecourseroom = courseroomService.updatecourseroom(courseroom);
            cr.setCode(0);
            cr.setMsg("修改" + courseroom.getId() + "成功");
            cr.setData(updatecourseroom);

        }
        return cr;

    }

    @RequestMapping("/delcourseroom.do")
    @ResponseBody
    public ModelAndView delcourse(HttpServletRequest request) {
        String[] ids = request.getParameterValues("id");
        courseroomService.delCourseroom(ids);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Courseroom_check.jsp");
        return mv;
    }
}
