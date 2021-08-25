package com.srp.controller;

import com.alibaba.fastjson.JSON;
import com.srp.bean.Activity;
import com.srp.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @GetMapping("/all_activities/{first}/{last}")
    public String selectAllActivity(@PathVariable("first")int first,@PathVariable("last")int last){
        List<Activity> activities = activityService.selectAllActivity(first,last);
        return JSON.toJSONString(activities);
    }
    @GetMapping("/all_activity")
    public String selectAllActivities(){
        List<Activity> activities = activityService.selectAllActivities();
        return JSON.toJSONString(activities);
    }
    @GetMapping("/total_activities")
    public String selectTotalActivities(){
        Activity activity = new Activity();
        activity.setTotal(activityService.selectTotalActivities());
        return JSON.toJSONString(activity);
    }
    @GetMapping("/single_activities/{cId}")
    public String selectSingleTotalActivities(@PathVariable int cId){
        Activity activity = new Activity();
        activity.setTotal(activityService.selectSingleTotalActivities(cId));
        return JSON.toJSONString(activity);
    }

    /**
     * 根据社团名称查询该社团所有活动
     * @param cId 社团id
     * @return 该社团所有活动
     */
    @GetMapping("/activities/{cId}")
    public String selectAllActivityByCid(@PathVariable("cId")int cId){
        List<Activity> list = activityService.selectAllActivityByCid(cId);
        return JSON.toJSONString(list);
    }

    @GetMapping("/activity/{aId}")
    public String selectActivityByaId(@PathVariable("aId")int aId){
        Activity activity = activityService.selectActivityByaId(aId);
        return JSON.toJSONString(activity);
    }

    /**
     * 添加活动
     * @param activity 活动添加
     * @return 是否添加成功
     */
    @PostMapping("/activities")
    public String addActivity(@RequestBody Activity activity){
        try {
            activityService.addActivity(activity);
            return JSON.toJSONString(activity.getaId());
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }
    /**
     * 修改活动
     * @param activity 活动修改
     * @return 是否修改成功
     */
    @PutMapping("/activities")
    public String updateActivity(@RequestBody Activity activity){
        try {
            int aId = activityService.updateActivity(activity);
            return JSON.toJSONString(aId);
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 根据活动id删除活动
     * @param aId 活动id
     * @return 是否删除成功
     */
    @DeleteMapping("/activities/{aId}")
    public String deleteActivity(@PathVariable("aId")int aId){
        try {
            activityService.deleteActivity(aId);
            return JSON.toJSONString("success");
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }
}
