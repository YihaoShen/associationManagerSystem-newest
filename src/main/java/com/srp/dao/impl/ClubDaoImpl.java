package com.srp.dao.impl;

import com.srp.bean.Activity;
import com.srp.bean.Club;
import com.srp.dao.ClubDao;
import com.srp.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class ClubDaoImpl implements ClubDao {
    @Override
    public Club showClubDao(String cName) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Club club = new Club();
        String sql = "select * from club where cName=?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                club.setcName(resultSet.getString("cName"));
                club.setcDescription(resultSet.getString("cDescription"));
                club.setcCreateTime(resultSet.getDate("cCreateTime").toLocalDate());
                System.out.println("dao:" + club.getcName() + " " + club.getcDescription() + " " + club.getcCreateTime());
            }

            return club;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DBUtil.close(connection, preparedStatement, resultSet);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return club;
    }

    @Override
    public ArrayList<String> getClubNamesDao() {
        Connection connection = DBUtil.getConnection();
        String sql = "select cName from club";
        ArrayList<String> list = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String cName = resultSet.getString("cName");
                list.add(cName);
            }

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public ArrayList<Club> joinedClubDao(String uName) {


        ArrayList<Club> list = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select * from club where cId in(select cId from club_member where uId=( select uId from user where uName=?));";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, uName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                list.add(new Club(resultSet.getInt("cId"),
                        resultSet.getString("cName"), //社团名称
                        resultSet.getString("cDescription"),    //社团描述
                        resultSet.getDate("cCreateTime").toLocalDate()));         //社团类型
            }

            return list;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DBUtil.close(connection, preparedStatement, resultSet);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public ArrayList<Activity> showClubActivityDao(String cName) {

        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Activity> list = new ArrayList<>();
        String sql = "select * from activity where aId in (select aId from club join activity where club.cId=activity.cId and club.cName= ? )";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                list.add(new Activity(0, resultSet.getString("aTitle"), resultSet.getString("aContent"), resultSet.getDate("aAnnouncedTime").toLocalDate(),resultSet.getString("aIntroduction")));
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

        return list;
    }

    @Override
    public ArrayList<Activity> getAllActivityByUNameDao(String uName) throws SQLException {
        ArrayList<Activity> list=new ArrayList<>();

        Connection connection=DBUtil.getConnection();
        String sql="select * from activity where aId in \n" +
                "(select aId from activity where cId in (\n" +
                "select cId from club_member where uId=(select uId from user where uName=?)))";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,uName);
        ResultSet resultSet=preparedStatement.executeQuery();

        while(resultSet.next()){
            list.add(new Activity(0,resultSet.getString("aTitle"),
                                    resultSet.getString("aContent"),
                                    resultSet.getDate("aAnnouncedTime").toLocalDate()
                                   ,resultSet.getString("aIntroduction")));
        }
        DBUtil.close(connection,preparedStatement,resultSet);
        return list;
    }
}
