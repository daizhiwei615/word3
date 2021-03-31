package com.daizhiwei.entity;

public class Course {
    private Integer cno;
    private String cname;
    private String cstartyear;
    private String cstartterm;

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
        return "Course{" +
                "cno=" + cno +
                ", cname='" + cname + '\'' +
                ", cstartyear='" + cstartyear + '\'' +
                ", cstartterm='" + cstartterm + '\'' +
                '}';
    }
}
