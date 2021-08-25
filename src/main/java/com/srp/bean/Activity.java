package com.srp.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.time.LocalDate;

/**
 * 社团活动
 */
public class Activity {

    private int aId;

    private int cId;

    private String aTitle;

    private String aContent;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate aAnnouncedTime;

    private String cName;

    private String uStuNumber;

    private String aIntroduction;

    private String aPhoto;

    private String activity_type;

    private int total;

    public Activity() {
    }


    public Activity(int aId, String aTitle, String aContent, LocalDate aAnnouncedTime, String aIntroduction) {
        this.aId = aId;
        this.aTitle = aTitle;
        this.aContent = aContent;
        this.aAnnouncedTime = aAnnouncedTime;
        this.aIntroduction = aIntroduction;
    }

    public Activity(int cId, String aTitle, String aContent, LocalDate aAnnouncedTime, String cName, String uStuNumber, String aIntroduction, String aPhoto, String activity_type, int total) {
        this.cId = cId;
        this.aTitle = aTitle;
        this.aContent = aContent;
        this.aAnnouncedTime = aAnnouncedTime;
        this.cName = cName;
        this.uStuNumber = uStuNumber;
        this.aIntroduction = aIntroduction;
        this.aPhoto = aPhoto;
        this.activity_type = activity_type;
        this.total = total;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    public LocalDate getaAnnouncedTime() {
        return aAnnouncedTime;
    }

    public void setaAnnouncedTime(LocalDate aAnnouncedTime) {
        this.aAnnouncedTime = aAnnouncedTime;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getuStuNumber() {
        return uStuNumber;
    }

    public void setuStuNumber(String uStuNumber) {
        this.uStuNumber = uStuNumber;
    }

    public String getaIntroduction() {
        return aIntroduction;
    }

    public void setaIntroduction(String aIntroduction) {
        this.aIntroduction = aIntroduction;
    }

    public String getaPhoto() {
        return aPhoto;
    }

    public void setaPhoto(String aPhoto) {
        this.aPhoto = aPhoto;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
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

    @Override
    public String toString() {
        return "Activity{" +
                "aId=" + aId +
                ", cId=" + cId +
                ", aTitle='" + aTitle + '\'' +
                ", aContent='" + aContent + '\'' +
                ", aAnnouncedTime=" + aAnnouncedTime +
                ", cName='" + cName + '\'' +
                ", uStuNumber='" + uStuNumber + '\'' +
                ", aIntroduction='" + aIntroduction + '\'' +
                ", aPhoto='" + aPhoto + '\'' +
                ", activity_type='" + activity_type + '\'' +
                ", total=" + total +
                '}';
    }

    public void setTotal(int total) {
        this.total = total;
    }
}