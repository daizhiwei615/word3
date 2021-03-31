package com.daizhiwei.service;

import com.daizhiwei.entity.Courseroom;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface CourseroomService {
    int addcourseroom (Courseroom courseroom);
    List<Courseroom> checkCourseroom(@Param("cid") Integer cid,
                                     @Param("week") String week);
    Courseroom checkcourseroom2(Integer id);
    int updatecourseroom(Courseroom courseroom);
    void delCourseroom(String[] id);
}
