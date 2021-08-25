package com.srp.dao.impl;

import com.srp.bean.User;
import com.srp.dao.UserDao;
import com.srp.util.DBUtil;

import java.sql.*;

public class UserDaoImpl implements UserDao {

    private static Connection connection = null;
    private static PreparedStatement preparedStatement = null;
    private static ResultSet resultSet = null;

    @Override
    public String[] loginDao(String uStuNumber, String uPassword) {
        String[] user=new String[10];
        try {
            Connection connection = DBUtil.getConnection();
            String sql = "select uName,uPhoto,uId from user where uStuNumber=? and uPassword=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, uStuNumber);
            preparedStatement.setString(2, uPassword);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user[0]=resultSet.getString("uName");
                user[1]=resultSet.getString("uPhoto");
                user[2]=resultSet.getString("uId");
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DBUtil.close(connection, preparedStatement, resultSet);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     *
     * 普通管理员登录
     *
     *
     * @param
     * @return
     */


    public String[] adminLoginDao(String uStuNumber,String uPassword) throws SQLException {
        System.out.println("superDao:para=>"+uStuNumber);
        System.out.println("superDao:para=>"+uPassword);
        String sql="select cId,uId from club_member where uId=(select uId from user where role in (1,2) and uId=(select uId from user where uStuNumber=? and uPassword=?))";

        Connection connection=DBUtil.getConnection();
        PreparedStatement preparedStatement= connection.prepareStatement(sql);
        preparedStatement.setString(1,uStuNumber);
        preparedStatement.setString(2,uPassword);
        ResultSet resultSet=preparedStatement.executeQuery();

        String[] cId_uId=new String[2];

        while(resultSet.next()){
            cId_uId[0]=resultSet.getString("cId");
            cId_uId[1]=resultSet.getString("uId");
            break;
        }

        System.out.println("=====>"+cId_uId[0]+"\t"+cId_uId[1]);

        DBUtil.close(connection,preparedStatement,resultSet);
        return cId_uId;


    }

    /**
     *
     * 超级管理员登录
     * @param uStuNumber
     * @return
     * @throws SQLException
     */
    public boolean superLoginDao(String uStuNumber,String uPassword) throws SQLException {
        System.out.println("superDao:para=>"+uStuNumber);
        String sql="select cId,uId from club_member where uId=(select uId from user where role ='0' and uId=(select uId from user where uStuNumber=?))";

        Connection connection=DBUtil.getConnection();
        PreparedStatement preparedStatement= connection.prepareStatement(sql);
        preparedStatement.setString(1,uStuNumber);
        ResultSet resultSet=preparedStatement.executeQuery();

        String[] cId_uId=new String[2];

        while(resultSet.next()){
            if (resultSet.getString("cId")!=null && resultSet.getString("uId")!=null)
                return true;
        }


        DBUtil.close(connection,preparedStatement,resultSet);
        return false;


    }


        //uId
    @Override
    public boolean registerDao(User u) throws SQLException {
        //判断该用户是否已经存在
        Connection connection=DBUtil.getConnection();
        PreparedStatement preparedStatement= null;
        ResultSet resultSet=null;
        String uStuNumber=null;
        String uName=u.getuName();

        System.out.println("{"+u.toString()+"}");

        try {
            preparedStatement = connection.prepareStatement("select uStuNumber from user where uName=? ");
            preparedStatement.setString(1,uName);
            resultSet=preparedStatement.executeQuery();

            while(resultSet.next()){
                uStuNumber =resultSet.getString("uStuNumber");
                System.out.println(uStuNumber);
            }

            if (uStuNumber==null){
                System.out.println("可以注册");
                String sql = "insert into user (uName,uStuNumber,uSex,uCollege,uCurrentMajor,uEnrolTime,phone,qq,uPassword) values (?,?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, u.getuName());
                preparedStatement.setString(2, u.getuStuNumber());
                preparedStatement.setString(3, u.getuSex());
                preparedStatement.setString(4, u.getuCollege());
                preparedStatement.setString(5, u.getuCurrentMajor());
                preparedStatement.setDate(6, java.sql.Date.valueOf(u.getuEnrolTime()));
                preparedStatement.setString(7, u.getPhone());
                preparedStatement.setString(8, u.getQq());
                preparedStatement.setString(9, u.getuPassword());

                preparedStatement.executeUpdate();

                return true;


            } else{
                System.out.println("已经存在该用户");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        DBUtil.close(connection,preparedStatement,resultSet);



        //Connection connection = DBUtil.getConnection();
        //insert into user (uName,uStuNumber,uSex,uCollege,uCurrentMajor,uEnrolTime,phone,qq,uPassword)
        //values
        //('黑夜','20181000001','女','信科院','电子工程','2018-9-1','19915238311','2240483657','123456');


//        try {
//
//
//            col = preparedStatement.executeUpdate();    //col记录影响结果的数据
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                DBUtil.close(connection,preparedStatement);
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//

        return false;
    }

    @Override
    public String upDateUserInfoDao(User u) {
        Connection connection=DBUtil.getConnection();
        String sql="update user set uCollege=?,uCurrentMajor=?,phone=?,qq=?,uPassword=? where uName=?";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,u.getuCollege());
            preparedStatement.setString(2,u.getuCurrentMajor());
            preparedStatement.setString(3,u.getPhone());
            preparedStatement.setString(4,u.getQq());
            preparedStatement.setString(5,u.getuPassword());

            int resultSet=preparedStatement.executeUpdate();
            return "修改成功";
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                DBUtil.close(connection,preparedStatement);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "修改失败";
    }

    @Override
    public User userInfoDao(String uName) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql="select * from user where uName=?";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,uName);
        ResultSet resultSet=preparedStatement.executeQuery();
        User user=new User();
        while(resultSet.next()){
            user.setuName(resultSet.getString("uName"));    //姓名
            user.setuStuNumber(resultSet.getString("uStuNumber"));  //学号
            user.setuSex(resultSet.getString("uSex"));  //性别
            user.setuCollege(resultSet.getString("uCollege"));  //学院
            user.setuCurrentMajor(resultSet.getString("uCurrentMajor"));    //专业
            user.setuEnrolTime(resultSet.getDate("uEnrolTime").toLocalDate());
            user.setPhone(resultSet.getString("phone"));
            user.setQq(resultSet.getString("qq"));
        }

        DBUtil.close(connection,preparedStatement,resultSet);
        return user;
    }

    //把图片路径写进数据库当中
    @Override
    public boolean writeImgToUploadDao(int uId,String path) {
        try{
            Connection connection=DBUtil.getConnection();
            String sql="update user set uPhoto=? where uId=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,path);
            preparedStatement.setInt(2,uId);
           preparedStatement.executeUpdate();

            System.out.println("==>头像写入数据库成功");

            DBUtil.close(connection,preparedStatement);
            return true;
        } catch (Exception e){
            return false;
        }

    }

    //根据学号获取到uId

    @Override
    public int getUIdDao(String uStuNumber) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql="select uId from user where uStuNumber=?;";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,uStuNumber);

        ResultSet resultSet=preparedStatement.executeQuery();
        while(resultSet.next()){
            return resultSet.getInt("uId");
        }

        return 0;
    }
}
