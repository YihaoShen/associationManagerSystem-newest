package com.srp.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

/**
 * 社团
 */
public class Club {
    private int cId;

    private String cName;

    private String cDescription;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate cCreateTime;

    private String activity_type;

    private String uStuNumber;

    private String sPhoto;

    private String cPhoto;

    private String tPhoto;

    private int total;

    public Club() {
    }

    public Club(String cName, String cDescription, LocalDate cCreateTime, String activity_type, String uStuNumber, String sPhoto, String cPhoto, String tPhoto, int total) {
        this.cName = cName;
        this.cDescription = cDescription;
        this.cCreateTime = cCreateTime;
        this.activity_type = activity_type;
        this.uStuNumber = uStuNumber;
        this.sPhoto = sPhoto;
        this.cPhoto = cPhoto;
        this.tPhoto = tPhoto;
        this.total = total;
    }

    public Club(String cName, String cDescription, LocalDate cCreateTime) {
        this.cName = cName;
        this.cDescription = cDescription;
        this.cCreateTime = cCreateTime;
    }

    public Club(int cId, String cName, String cDescription, LocalDate cCreateTime) {
        this.cId=cId;
        this.cName=cName;
        this.cDescription=cDescription;
        this.cCreateTime=cCreateTime;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDescription() {
        return cDescription;
    }

    public void setcDescription(String cDescription) {
        this.cDescription = cDescription;
    }

    public LocalDate getcCreateTime() {
        return cCreateTime;
    }

    public void setcCreateTime(LocalDate cCreateTime) {
        this.cCreateTime = cCreateTime;
    }

    public String getuStuNumber() {
        return uStuNumber;
    }

    public void setuStuNumber(String uStuNumber) {
        this.uStuNumber = uStuNumber;
    }

    public String getsPhoto() {
        return sPhoto;
    }

    public void setsPhoto(String sPhoto) {
        this.sPhoto = sPhoto;
    }

    public String getcPhoto() {
        return cPhoto;
    }

    public void setcPhoto(String cPhoto) {
        this.cPhoto = cPhoto;
    }

    public String gettPhoto() {
        return tPhoto;
    }

    public void settPhoto(String tPhoto) {
        this.tPhoto = tPhoto;
    }

    public String getActivity_type() {
        return activity_type;
    }

    public void setActivity_type(String activity_type) {
        this.activity_type = activity_type;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

}