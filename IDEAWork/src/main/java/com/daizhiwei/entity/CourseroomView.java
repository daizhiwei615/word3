package com.daizhiwei.entity;

public class CourseroomView {
    private Integer id;
    private Integer cno;
    private String cname;
    private Integer Tid;
    private String Tname;
    private Integer cid;
    private String house;
    private String room;
    private String week;
    private String starttime;
    private String lasttime;
    private String cstartyear;
    private String cstartterm;

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

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getTid() {
        return Tid;
    }

    public void setTid(Integer tid) {
        Tid = tid;
    }

    public String getTname() {
        return Tname;
    }

    public void setTname(String tname) {
        Tname = tname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getCstartyear() {
        return cstartyear;
    }

    public void setCstartyear(String cstartyear) {
        this.cstartyear = cstartyear;
    }

    public String getCstartterm() {
        return cstartterm;
    }

    public void setCstartterm(String cstartterm) {
        this.cstartterm = cstartterm;
    }

    @Override
    public String toString() {
        return "CourseroomView{" +
                "id=" + id +
                ", cno=" + cno +
                ", cname='" + cname + '\'' +
                ", Tid=" + Tid +
                ", Tname='" + Tname + '\'' +
                ", cid=" + cid +
                ", house='" + house + '\'' +
                ", room='" + room + '\'' +
                ", week='" + week + '\'' +
                ", starttime='" + starttime + '\'' +
                ", lasttime='" + lasttime + '\'' +
                ", cstartyear='" + cstartyear + '\'' +
                ", cstartterm='" + cstartterm + '\'' +
                '}';
    }
}
