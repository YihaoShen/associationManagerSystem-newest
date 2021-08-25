package com.srp.bean;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;

/**
 * 社团成员
 */
@Data
public class ClubMember {
    private int cId;

    private int uId;

    private int role;

    private String roleName;

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

    private int status;

    public ClubMember() {
    }

    public ClubMember(int uId, int role, String roleName, String uStuNumber, String uName, String uSex, String uCollege, String uCurrentMajor, LocalDate uEnrolTime, String phone, String qq, String uPassword, String uPhoto, int status) {
        this.uId = uId;
        this.role = role;
        this.roleName = roleName;
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
        this.status = status;
    }

    @Override
    public String toString() {
        return "ClubMember{" +
                "cId=" + cId +
                ", uId=" + uId +
                ", role=" + role +
                ", roleName='" + roleName + '\'' +
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
                ", status=" + status +
                '}';
    }
}