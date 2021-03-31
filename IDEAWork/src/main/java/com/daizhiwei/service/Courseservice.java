package com.daizhiwei.service;

import com.daizhiwei.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Courseservice {
    int addcourse(Course course);

    Course checkcourse(Integer cno);


    int upcourse(Course course);



    List<Course> checkcourse4(@Param("cname")String cname,
                        @Param("cstartyear")String cstartyear,
                        @Param("cstartterm")String cstartterm);


    void delCourse(String[] cno);

}
