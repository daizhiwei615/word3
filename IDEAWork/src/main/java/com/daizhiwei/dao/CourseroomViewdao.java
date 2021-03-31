package com.daizhiwei.dao;

import com.daizhiwei.entity.CourseroomView;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseroomViewdao {
    List<CourseroomView> searchCourseroomView(@Param("cname") String cname,
                                              @Param("house") String house,
                                              @Param("cstartyear") String cstartyear,
                                              @Param("cstartterm") String cstartterm);
    CourseroomView selecourseroomview(Integer id);

}
