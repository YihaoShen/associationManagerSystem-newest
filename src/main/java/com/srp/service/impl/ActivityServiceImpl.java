package com.srp.service.impl;

import com.srp.bean.Activity;
import com.srp.dao.ActivityMapper;
import com.srp.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Activity> selectAllActivity(int first,int last) {
        return activityMapper.selectAllActivity(first,last);
    }

    @Override
    public List<Activity> selectAllActivities() {
        return activityMapper.selectAllActivities();
    }

    @Override
    public int selectTotalActivities() {
        return activityMapper.selectTotalActivities();
    }

    @Override
    public int selectSingleTotalActivities(int cId) {
        return activityMapper.selectSingleTotalActivities(cId);
    }

    @Override
    public List<Activity> selectAllActivityByCid(int cId) {
        return activityMapper.selectAllActivityByCid(cId);
    }

    @Override
    public Activity selectActivityByaId(int aId) {
        return activityMapper.selectActivityByaId(aId);
    }

    @Override
    public int addActivity(Activity activity) {
        return activityMapper.addActivity(activity);
    }

    @Override
    public int updateActivity(Activity activity) {
        return activityMapper.updateActivity(activity);
    }

    @Override
    public void deleteActivity(int aId) {
        activityMapper.deleteActivity(aId);
    }
}
