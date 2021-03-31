package com.daizhiwei.service;

import com.daizhiwei.entity.CourseroomView;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseroomViewService {
    List<CourseroomView> checkCourseroomViewdao(@Param("cname") String cname,
                                                @Param("house") String house,
                                                @Param("cstartyear") String cstartyear,
                                                @Param("cstartterm") String cstartterm);
    CourseroomView checkcourseroomview2(Integer id);

}
