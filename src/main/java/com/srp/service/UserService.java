package com.srp.service;

import com.srp.bean.User;

import java.sql.SQLException;

public interface UserService {
    User getuPhoto(int uId);
    String[] loginService(String uStuNumber, String uPassword);
    boolean registerService(User u) throws SQLException;
    String updateUserInfoService(User u);
    User userInfoService(String uName) throws SQLException;
    String[] adminLoginService(String uStuNumber,String uPassword) throws SQLException;
    boolean superLoginService(String uStuNumber,String uPassword) throws SQLException;

    boolean writeImgToUploadService(int uId,String path) throws SQLException;

    int getUIdService(String uStuNumber) throws SQLException;
}
