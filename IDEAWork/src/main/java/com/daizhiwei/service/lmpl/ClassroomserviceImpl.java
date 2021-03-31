package com.daizhiwei.service.lmpl;

import com.daizhiwei.dao.Classroomdao;
import com.daizhiwei.entity.Classroom;
import com.daizhiwei.service.Classroomservice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClassroomserviceImpl implements Classroomservice {
    @Resource
    private Classroomdao classroomdao;
    public List<Classroom> checkclassroom(String house, String room) {
        List<Classroom> classroomList = classroomdao.searchclassroom(house,room);
        return classroomList;
    }

    public int addclassroom(Classroom classroom) {
        int insertclassroom = classroomdao.insertclassroom(classroom);
        return  insertclassroom;
    }

    public Classroom checkclassroom2(Integer cid) {
        Classroom seleclassroom = classroomdao.seleclassroom(cid);
        return seleclassroom;
    }

    public int updateclassroom(Classroom classroom) {
        int upclassroom = classroomdao.upclassroom(classroom);
        return upclassroom;
    }

    public void delclassroom(String[] cids) {
        for (String cid:cids){
           classroomdao.deleteclassroom(cid);
        }


    }
}
