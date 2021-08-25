package com.srp.dao;

import com.srp.bean.Activity;
import com.srp.bean.Club;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

//社团相关
public interface ClubDao {

    //查看社团的详细信息
    public Club showClubDao(String cName);
    //获得所有社团的名称
    public ArrayList<String> getClubNamesDao();
    //查看自己以及加入了哪些社团(自己姓名)
    public ArrayList<Club> joinedClubDao(String uName);
    //产看自己参加的的单个社团举办过哪些活动
    public ArrayList<Activity> showClubActivityDao(String cName);

    //根据用户名称获取到该用户加入所有社团举办过所有的活动
    public ArrayList<Activity> getAllActivityByUNameDao(String uName) throws SQLException;
}
