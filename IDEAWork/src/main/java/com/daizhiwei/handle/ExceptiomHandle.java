package com.daizhiwei.handle;


import com.daizhiwei.exception.AgeException;
import com.daizhiwei.exception.CatExecptiom;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class ExceptiomHandle  {
    @ExceptionHandler(value = AgeException.class)
    public ModelAndView ageEx(Exception e) {
        ModelAndView mv1 = new ModelAndView();
        mv1.addObject("ageerror", "年龄不能为空");
        mv1.setViewName("login");
        return mv1;
    }

        @ExceptionHandler(value = CatExecptiom.class)
    public ModelAndView catEx(Exception e) {
        ModelAndView mv1 = new ModelAndView();
        mv1.addObject("ageerror1", "id已经存在");
        mv1.setViewName("login");
        return mv1;
    }
  /*
    @ExceptionHandler
     public ModelAndView agelEx(Exception e) {
        ModelAndView mv1 = new ModelAndView();
        mv1.addObject("ageerrorl", "等会再试");
        mv1.setViewName("ageerrorl");
        return mv1;
    }
   */

}
