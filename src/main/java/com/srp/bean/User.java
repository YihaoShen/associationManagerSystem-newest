package com.srp.bean;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

/**
 * 用户
 */
@Data
public class User {
    private int uId;

    private String uStuNumber;

    private String uName;

    private String uSex;

    private String uCollege;

    private String uCurrentMajor;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate uEnrolTime;

    private String phone;

    private String qq;

    private String uPassword;

    private String uPhoto;

    public User() {
    }

    public User(String uName, String uPhoto) {
        this.uName = uName;
        this.uPhoto = uPhoto;
    }

    public User(String uStuNumber, String uName, String uSex, String uCollege, String uCurrentMajor, LocalDate uEnrolTime, String phone, String qq, String uPassword, String uPhoto) {
        this.uStuNumber = uStuNumber;
        this.uName = uName;
        this.uSex = uSex;
        this.uCollege = uCollege;
        this.uCurrentMajor = uCurrentMajor;
        this.uEnrolTime = uEnrolTime;
        this.phone = phone;
        this.qq = qq;
        this.uPassword = uPassword;
        this.uPhoto = uPhoto;
    }

    public User(String uStuNumber, String uName, String uSex, String uCollege, String uCurrentMajor, LocalDate date, String phone, String qq, String uPassword) {
        this.uStuNumber=uStuNumber;
        this.uName=uName;
        this.uSex=uSex;
        this.uCollege=uCollege;
        this.uCurrentMajor=uCurrentMajor;
        this.uEnrolTime=date;
        this.phone=phone;
        this.qq=qq;
        this.uPassword=uPassword;

    }

    public User(String uStuNumber, String uName, String uSex, String uCollege, String uCurrentMajor, LocalDate date, String qq, String uPassword) {
        this.uStuNumber=uStuNumber;
        this.uName=uName;
        this.uSex=uSex;
        this.uCollege=uCollege;
        this.uCurrentMajor=uCurrentMajor;
        this.uEnrolTime=date;
        this.qq=qq;
        this.uPassword=uPassword;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuStuNumber() {
        return uStuNumber;
    }

    public void setuStuNumber(String uStuNumber) {
        this.uStuNumber = uStuNumber;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuSex() {
        return uSex;
    }

    public void setuSex(String uSex) {
        this.uSex = uSex;
    }

    public String getuCollege() {
        return uCollege;
    }

    public void setuCollege(String uCollege) {
        this.uCollege = uCollege;
    }

    public String getuCurrentMajor() {
        return uCurrentMajor;
    }

    public void setuCurrentMajor(String uCurrentMajor) {
        this.uCurrentMajor = uCurrentMajor;
    }

    public LocalDate getuEnrolTime() {
        return uEnrolTime;
    }

    public void setuEnrolTime(LocalDate uEnrolTime) {
        this.uEnrolTime = uEnrolTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuPhoto() {
        return uPhoto;
    }

    public void setuPhoto(String uPhoto) {
        this.uPhoto = uPhoto;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uStuNumber='" + uStuNumber + '\'' +
                ", uName='" + uName + '\'' +
                ", uSex='" + uSex + '\'' +
                ", uCollege='" + uCollege + '\'' +
                ", uCurrentMajor='" + uCurrentMajor + '\'' +
                ", uEnrolTime=" + uEnrolTime +
                ", phone='" + phone + '\'' +
                ", qq='" + qq + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", uPhoto='" + uPhoto + '\'' +
                '}';
    }
}