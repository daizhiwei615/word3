package com.daizhiwei.service;




import com.daizhiwei.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Teacherservice {
    List<Teacher> checkteacher();
    List<Teacher> checkteacher(@Param("Tname") String Tname,
                               @Param("Tage") String Tage);
    int addteacher(Teacher teacher);
    Teacher checkteacher2(Integer tid);
    int updateteacher (Teacher teacher);
    void delteacher(String[] tid);

}
