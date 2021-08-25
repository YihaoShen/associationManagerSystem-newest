package com.srp.controller;

import com.alibaba.fastjson.JSON;
import com.srp.bean.Activity;
import com.srp.bean.Club;
import com.srp.service.ClubService;
import com.srp.util.LayuiResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class ClubController {
    @Autowired
    private ClubService clubService;

    /**
     * 查询全部社团
     *
     * @return 全部社团
     */
    @GetMapping("/clubs")
    public String selectAllClub() {
        List<Club> list = clubService.selectAllClub();
        return JSON.toJSONString(list);
    }

    /**
     * 查询申请的社团
     *
     * @return 申请的社团
     */
    @GetMapping("/clubApply")
    public Object selectApplyClub() {
        List<Club> list = clubService.selectApplyClub();
        return LayuiResponseResult.renderSuccess(list,list.size());
    }

    @GetMapping("/total_club")
    public String selectTotalClub() {
        Club club = new Club();
        club.setTotal(clubService.selectTotalClub());
        return JSON.toJSONString(club);
    }

    @GetMapping("/clubs/{first}/{last}")
    public String selectClubByFL(@PathVariable("first") int first, @PathVariable("last") int last) {
        List<Club> clubs = clubService.selectClubByFL(first, last);
        return JSON.toJSONString(clubs);
    }

    /**
     * 查询单个社团信息
     *
     * @param cId 社团id
     * @return 单个社团信息
     */
    @GetMapping("/clubs/{cId}")
    public String selectClubById(@PathVariable int cId) {
        Club club = clubService.selectClubById(cId);
        return JSON.toJSONString(club);
    }

    /**
     * 添加社团
     *
     * @param club 社团信息
     * @return 是否添加成功
     */
    @PostMapping("/clubs")
    public String addClub(@RequestBody Club club) {
        try {
            clubService.addClub(club);
            return JSON.toJSONString("success");
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 根据社团id删除社团
     *
     * @param cId 社团id
     * @return 是否删除成功
     */
    @DeleteMapping("/clubs/{cId}")
    public String deleteClub(@PathVariable("cId") int cId) {
        try {
            clubService.deleteClub(cId);
            return JSON.toJSONString("success");
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 修改社团信息
     *
     * @param cId  社团id
     * @param club 社团信息
     * @return 是否修改成功
     */
    @PutMapping("/clubs/{cId}")
    public String updateClub(@PathVariable("cId") int cId, @RequestBody Club club) {
        try {
            club.setcId(cId);
            clubService.updateClub(club);
            return JSON.toJSONString("success");
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 修改社团状态
     *
     * @param cId  社团id
     * @return 是否修改成功
     */
    @PutMapping("/clubApply/{cId}")
    public String agreeClub(@PathVariable("cId") int cId) {
        try {
            clubService.agreeClub(cId);
            return JSON.toJSONString("success");
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * @param cName
     * @param httpSession
     * @return Club
     * @description 查询某一个社团的详细信息
     * @version v1.0.0
     * @author heiye
     */
    @RequestMapping(value = "/showClub/{cName}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Club showClub(@PathVariable("cName") String cName, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView();
        if (httpSession != null) {
            Club club = clubService.showClubService(cName);
            System.out.println(club.getcName() + " " + club.getcDescription() + " " + club.getcCreateTime());
            return club;
        } else {
            mv.setViewName("login");
        }

        return null;
    }

    /**
     * @param httpSession
     * @return ArrayList
     * @description 获取所有社团的名称
     * @version v1.0.0
     * @author heiye
     */
    @RequestMapping(value = "/getClubName", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getClubName(HttpSession httpSession) {
        ModelAndView mv = new ModelAndView();
        ArrayList<String> list = clubService.getClubNamesService();
        mv.addObject("list", list);
        return mv;
    }

    /**
     * @return ArrayList
     * @description 查看自己已经加入的社团以及详细信息
     * @version v1.0.0
     * @author heiye
     */

    @RequestMapping(value = "/joinedClub/{uName}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public ModelAndView joinedClub(HttpServletRequest request, HttpSession session, @PathVariable("uName") String uName) {
        ModelAndView mv = new ModelAndView();
        if (session.getAttribute("uName").equals(uName)) {
            ArrayList<Club> list = clubService.joinedClubService(uName);
            for (Club c : list) {
                System.out.println(c.toString());
            }

            mv.addObject("clubList", list);

            mv.setViewName("index");
        } else {
            mv.setViewName("login");
        }

        return mv;
    }


    /**
     * @param httpSession
     * @param cName
     * @return ArrayList
     * @description 查看自己参加的某一个社团举办过的活动
     * @version v1.0.0
     * @author heiye
     */
    @RequestMapping(value = "/showClubActivity/{cName}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView showClubActivity(HttpSession httpSession, @PathVariable("cName") String cName) {
        ModelAndView mv = new ModelAndView();
        if (httpSession != null) {
            ArrayList<Activity> list = clubService.showClubActivityService(cName);
            mv.addObject("list", list);
            mv.setViewName("show_visited_activity");
            System.out.println(list);


            return mv;
        } else {
            mv.setViewName("login");
        }

        return null;
    }

    @RequestMapping(value = "/getAllActivityByUNameService/{uName}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getAllActivityByUName(@PathVariable("uName") String uName, HttpSession session) throws SQLException {
        ModelAndView mv = new ModelAndView();
        if (session.getAttribute("uName").equals(uName)) {
            ArrayList<Activity> list = clubService.getAllActivityByUNameService(uName);
            mv.addObject("activityList", list);
            //Log
            for (Activity a : list) {
//                session.setAttribute("aTitle",a.getaTitle());
//                session.setAttribute("aContent",a.getaContent());
//                session.setAttribute("aAnnouncedTime",a.getaAnnouncedTime());
//                session.setAttribute("aIntroduction",a.getaIntroduction());
//                session.setAttribute("aPhoto",a.getaPhoto());
            }

            session.setAttribute("activityList",list);
            mv.setViewName("index");
        } else {
            mv.setViewName("login");
        }

        return mv;
    }
}
