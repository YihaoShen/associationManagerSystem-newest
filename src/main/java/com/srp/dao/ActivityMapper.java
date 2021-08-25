package com.srp.dao;

import com.srp.bean.Activity;

import java.util.List;

public interface ActivityMapper {

    /**
     * 查询所有社团活动
     * @return
     */
    List<Activity> selectAllActivity(int first,int last);
    List<Activity> selectAllActivities();
    int selectTotalActivities();
    int selectSingleTotalActivities(int cId);
    /**
     * 查询单个社团的全部活动
     * @param cId 社团id
     * @return 单个社团的全部活动
     */
    List<Activity> selectAllActivityByCid(int cId);

    /**
     * 查询单个活动
     * @param aId
     * @return
     */
    Activity selectActivityByaId(int aId);
    /**
     * 添加社团活动
     * @param activity 活动信息
     */
    int addActivity(Activity activity);
    int updateActivity(Activity activity);
    /**
     * 根据aId删除活动
     * @param aId 活动id
     */
    void deleteActivity(int aId);
}