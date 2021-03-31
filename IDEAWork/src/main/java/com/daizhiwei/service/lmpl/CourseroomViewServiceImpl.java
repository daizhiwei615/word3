package com.daizhiwei.service.lmpl;

import com.daizhiwei.dao.CourseroomViewdao;
import com.daizhiwei.entity.CourseroomView;
import com.daizhiwei.service.CourseroomViewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseroomViewServiceImpl implements CourseroomViewService {
      @Resource
      private CourseroomViewdao courseroomViewdao;

    public List<CourseroomView> checkCourseroomViewdao(String cname, String house, String cstartyear, String cstartterm) {
        List<CourseroomView> courseroomViews = courseroomViewdao.searchCourseroomView(cname,house,cstartyear,cstartterm);
        return courseroomViews;
    }

    public CourseroomView checkcourseroomview2(Integer id) {
        CourseroomView selecourseroomview = courseroomViewdao.selecourseroomview(id);
        return selecourseroomview;
    }


}
