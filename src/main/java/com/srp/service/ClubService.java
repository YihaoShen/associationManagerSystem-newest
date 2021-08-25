package com.srp.service;

import com.srp.bean.Activity;
import com.srp.bean.Club;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface ClubService {
    /**
     * 查询所有社团
     * @return 所有社团信息
     */
    List<Club> selectAllClub();
    List<Club> selectApplyClub();
    List<Club> selectClubByFL(int first,int last);
    int selectTotalClub();
    /**
     * 根据社团id查询社团信息
     * @param cId 社团id
     * @return 单个社团信息
     */
    Club selectClubById(int cId);
    /**
     * 添加社团
     * @param club 新社团信息
     */
    void addClub(Club club);
    /**
     * 删除社团
     * @param cId 社团id
     */
    void deleteClub(int cId);
    void agreeClub(int cId);
    /**
     * 修改社团信息
     * @param club 社团信息
     */
    void updateClub(Club club);
    Club showClubService(String cName);  //查找某一个社团的详细信息

    ArrayList<String> getClubNamesService();    //获取所有社团的名称

    ArrayList<Club> joinedClubService(String uName);  //查看自己已经加入了哪些社团(用户名称)

    ArrayList<Activity> showClubActivityService(String cName);   //查看自己参加的社团举办过的活动

    ArrayList<Activity> getAllActivityByUNameService(String uName) throws SQLException;//根据用户姓名查看自己参加过的所有活动
}
