package com.daizhiwei.entity;

import java.sql.Date;

public class Courseroom {
    private Integer id;
    private Integer cno;
    private Integer Tid;
    private Integer cid;
    private String week;
    private Date starttime;
    private Date lasttime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getTid() {
        return Tid;
    }

    public void setTid(Integer tid) {
        Tid = tid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    @Override
    public String toString() {
        return "Courseroom{" +
                "id=" + id +
                ", cno=" + cno +
                ", Tid=" + Tid +
                ", cid=" + cid +
                ", week='" + week + '\'' +
                ", starttime=" + starttime +
                ", lasttime=" + lasttime +
                '}';
    }
}
