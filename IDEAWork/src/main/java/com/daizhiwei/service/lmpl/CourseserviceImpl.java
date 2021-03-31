package com.daizhiwei.service.lmpl;

import com.daizhiwei.dao.Coursedao;
import com.daizhiwei.entity.Course;
import com.daizhiwei.service.Courseservice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CourseserviceImpl implements Courseservice {
    @Resource
    private Coursedao coursedao;

    public int addcourse(Course course) {
        int insertcourse = coursedao.insertcourse(course);
        return insertcourse;
    }
    public Course checkcourse(Integer cno) {
        Course courseList = coursedao.selecourse(cno);
        return courseList;
    }

    public int upcourse(Course course) {
        //回显需要修改的课程
        int upcourse = coursedao.upcourse(course);
        return upcourse;
    }

    public List<Course> checkcourse4(String cname, String cstartyear, String cstartterm) {
        List<Course> courseList4 =  coursedao.selecourse4(cname, cstartyear,cstartterm);
        return courseList4;
    }

    public void delCourse(String[] cnos) {
        for (String cno:cnos){
            coursedao.deleteCourse(cno);
        }
    }



}
