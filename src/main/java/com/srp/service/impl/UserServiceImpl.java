package com.srp.service.impl;

import com.srp.bean.User;
import com.srp.dao.UserDao;
import com.srp.dao.UserMapper;
import com.srp.dao.impl.UserDaoImpl;
import com.srp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    UserDao userDao = new UserDaoImpl();

    @Override
    public User getuPhoto(int uId) {
        return userMapper.getuPhoto(uId);
    }

    //登录服务
    @Override
    public String[] loginService(String uStuNumber, String uPassword) {
        return userDao.loginDao(uStuNumber, uPassword);

    }

    @Override
    public boolean registerService(User u) throws SQLException {
        return userDao.registerDao(u);   //1成功,0失败
    }

    @Override
    public String updateUserInfoService(User u) {
        return userDao.upDateUserInfoDao(u);
    }

    @Override
    public User userInfoService(String uName) throws SQLException {
        return userDao.userInfoDao(uName);
    }

    @Override
    public String[] adminLoginService(String uStuNumber,String uPassword) throws SQLException {
        return userDao.adminLoginDao( uStuNumber,uPassword);
    }

    @Override
    public boolean superLoginService(String uStuNumber,String uPassword) throws SQLException {
        return userDao.superLoginDao(uStuNumber,uPassword);
    }

    @Override
    public boolean writeImgToUploadService(int uId,String path) throws SQLException{
        return userDao.writeImgToUploadDao(uId,path);
    }

    @Override
    public int getUIdService(String uStuNumber) throws SQLException {
        return userDao.getUIdDao(uStuNumber);
    }

}
