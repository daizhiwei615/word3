package com.daizhiwei.dao;

import com.daizhiwei.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Coursedao {
    int insertcourse(Course course);
    Course selecourse(Integer cno);
    int upcourse (Course course);
    List<Course> selecourse4(@Param("cname")String cname,
                       @Param("cstartyear")String cstartyear,
                       @Param("cstartterm")String cstartterm);
    void deleteCourse(String cno);
}
