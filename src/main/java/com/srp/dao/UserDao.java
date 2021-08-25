package com.srp.dao;

import com.srp.bean.User;

import java.sql.SQLException;

public interface UserDao {
    String[] loginDao(String uStuNumber, String uPassword);    //登录
    boolean registerDao(User u) throws SQLException;    //注册
    String upDateUserInfoDao(User u);  //更新用户信息
    User userInfoDao(String uName) throws SQLException; //获取到用户的所有信息

    String[] adminLoginDao(String uStuNumber,String uPassword) throws SQLException;
    boolean superLoginDao(String uStuNumber,String uPassword) throws SQLException;

    boolean writeImgToUploadDao(int uId,String path) throws SQLException;

    int getUIdDao(String uStuNumber) throws SQLException;
}
