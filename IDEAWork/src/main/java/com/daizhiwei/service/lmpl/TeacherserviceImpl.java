package com.daizhiwei.service.lmpl;

import com.daizhiwei.dao.Teacherdao;
import com.daizhiwei.entity.Teacher;
import com.daizhiwei.service.Teacherservice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TeacherserviceImpl implements Teacherservice {
    @Resource
    private Teacherdao teacherdao;
    public List<Teacher> checkteacher() {
        List<Teacher> teacherList = teacherdao.searchTeacher();
        return teacherList;
    }

    public List<Teacher> checkteacher(String Tname, String Tage) {
        List<Teacher> checkteacher = teacherdao.searchteacher(Tname, Tage);
        return checkteacher;
    }

    public int addteacher(Teacher teacher) {
        int insertteacher = teacherdao.insertteacher(teacher);
        return insertteacher;
    }

    public Teacher checkteacher2(Integer tid) {
        Teacher seleteacher = teacherdao.seleteacher(tid);
        return seleteacher;
    }

    public int updateteacher(Teacher teacher) {
        int upteacher = teacherdao.upteacher(teacher);
        return upteacher;
    }

    public void delteacher(String[] tids) {
        for (String tid:tids){
            teacherdao.deleteteacher(tid);
        }

    }
}
