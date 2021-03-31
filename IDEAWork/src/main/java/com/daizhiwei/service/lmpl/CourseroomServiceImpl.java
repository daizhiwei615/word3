package com.daizhiwei.service.lmpl;

import com.daizhiwei.dao.Courseroomdao;
import com.daizhiwei.entity.Courseroom;
import com.daizhiwei.service.CourseroomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseroomServiceImpl implements CourseroomService {
    @Resource
    private Courseroomdao courseroomdao;
    public int addcourseroom(Courseroom courseroom) {
        int insertcourseroom = courseroomdao.insertcourseroom(courseroom);
        return insertcourseroom;
    }

    public List<Courseroom> checkCourseroom(Integer cid, String week) {
        List<Courseroom> courseroomList = courseroomdao.searchCourseroom(cid, week);
        return courseroomList;
    }

    public Courseroom checkcourseroom2(Integer id) {
        Courseroom selecourseroom = courseroomdao.selecourseroom(id);
        return selecourseroom;
    }

    public int updatecourseroom(Courseroom courseroom) {
        int upcourseroom = courseroomdao.upcourseroom(courseroom);
        return upcourseroom;
    }



    public void delCourseroom(String[] ids) {
        for (String id:ids){
            courseroomdao.deleteCourseroom(id);
        }
    }


}
