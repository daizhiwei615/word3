package com.daizhiwei.dao;



import com.daizhiwei.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Teacherdao {
    List<Teacher> searchTeacher();
    List<Teacher> searchteacher(@Param("Tname") String Tname,
                                @Param("Tage") String Tage);
    int insertteacher(Teacher teacher);
    Teacher seleteacher(Integer tid);
    int upteacher (Teacher teacher);
    void deleteteacher(String tid);
}
