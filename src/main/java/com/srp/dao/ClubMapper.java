package com.srp.dao;

import com.srp.bean.Club;

import java.util.List;

public interface ClubMapper {
    /**
     * 查询所有社团
     * @return 所有社团信息
     */
    List<Club> selectAllClub();
    List<Club> selectApplyClub();
    int selectTotalClub();
    List<Club> selectClubByFL(int first,int last);
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
    /**
     * 修改社团信息
     * @param club 社团信息
     */
    void updateClub(Club club);
    void agreeClub(int cId);
}