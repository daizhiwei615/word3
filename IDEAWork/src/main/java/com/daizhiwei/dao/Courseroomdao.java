package com.daizhiwei.dao;

import com.daizhiwei.entity.Courseroom;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface Courseroomdao {
    int insertcourseroom(Courseroom courseroom);
    List<Courseroom> searchCourseroom(@Param("cid") Integer cid,
                                      @Param("week") String week);
    Courseroom selecourseroom(Integer id);
    int upcourseroom (Courseroom courseroom);
    void deleteCourseroom(String id);
}
