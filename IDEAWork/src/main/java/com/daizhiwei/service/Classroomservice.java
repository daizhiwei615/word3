package com.daizhiwei.service;

import com.daizhiwei.entity.Classroom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Classroomservice {
    List<Classroom> checkclassroom(@Param("house") String house,
                                   @Param("room") String room);
    int addclassroom (Classroom classroom);
    Classroom checkclassroom2(Integer cid);
    int updateclassroom(Classroom classroom);
    void delclassroom(String[] cid);
}
