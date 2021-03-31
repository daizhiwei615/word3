package com.daizhiwei.entity;

public class Teacher {
    private Integer Tid;
    private String Tname;
    private String Tage;

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

    public String getTage() {
        return Tage;
    }

    public void setTage(String tage) {
        Tage = tage;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "Tid=" + Tid +
                ", Tname='" + Tname + '\'' +
                ", Tage='" + Tage + '\'' +
                '}';
    }
}
