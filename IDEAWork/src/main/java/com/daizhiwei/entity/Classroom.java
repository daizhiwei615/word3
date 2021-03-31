package com.daizhiwei.entity;

public class Classroom {
    private Integer cid;
    private String house;
    private String room;

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

    @Override
    public String toString() {
        return "Classroom{" +
                "cid=" + cid +
                ", house='" + house + '\'' +
                ", room='" + room + '\'' +
                '}';
    }
}
