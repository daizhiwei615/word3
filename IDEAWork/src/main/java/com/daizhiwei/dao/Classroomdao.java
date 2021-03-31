package com.daizhiwei.dao;

import com.daizhiwei.entity.Classroom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Classroomdao {
    List<Classroom> searchclassroom(@Param("house") String house,
                                    @Param("room") String room);
    int insertclassroom(Classroom classroom);
    Classroom seleclassroom(Integer cid);
    int upclassroom (Classroom classroom);
    void deleteclassroom(String cid);
}
