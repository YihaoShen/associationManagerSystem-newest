package com.srp.controller;

import com.alibaba.fastjson.JSON;
import com.srp.bean.Club;
import com.srp.bean.ClubMember;
import com.srp.service.ClubMemberService;
import com.srp.util.LayuiResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ClubMemberController {

    @Autowired
    private ClubMemberService clubMemberService;

    /**
     * 查询单个社团全部成员
     * @param cId 社团id
     * @return 单个社团全部成员
     */
    @GetMapping("/clubMembers/{cId}")
    public Object selectAllClubMember(@PathVariable int cId){
        List<ClubMember> clubMembers = clubMemberService.selectAllClubMember(cId);
        return LayuiResponseResult.renderSuccess(clubMembers,clubMembers.size());
    }

    @GetMapping("/applyMember/{cId}")
    public Object selectApplyMember(@PathVariable int cId){
        List<ClubMember> clubMembers = clubMemberService.selectApplyMember(cId);
        return LayuiResponseResult.renderSuccess(clubMembers,clubMembers.size());
    }

    /**
     * 查询单个社团管理人员
     * @param cId 社团id
     * @return 单个社团管理人员
     */
    @GetMapping("/roleClubMember/{cId}")
    public Object selectRoleMember(@PathVariable int cId){
        List<ClubMember> clubMembers = clubMemberService.selectRoleMember(cId);
        return JSON.toJSONString(clubMembers);
    }

    /**
     * 查询某用户加入的所有社团
     * @param uId
     * @return
     */
    @GetMapping("/clubs_member/{uId}")
    public Object selectAllClubByUid(@PathVariable int uId){
        List<Club> clubs = clubMemberService.selectAllClubByUid(uId);
        return JSON.toJSONString(clubs);
    }

    /**
     * 根据姓名或者学号搜索成员信息
     * @param cId
     * @param uName
     * @param uStuNumber
     * @return
     */
    @GetMapping("/clubMembers/{cId}/{uName}/{uStuNumber}")
    public Object selectClubMemberByNameAndNumber(@PathVariable("cId") int cId,@PathVariable("uName") String uName,@PathVariable("uStuNumber") String uStuNumber){
        List<ClubMember> clubMembers = clubMemberService.selectClubMemberByNameAndNumber(cId,uName,uStuNumber);
        return LayuiResponseResult.renderSuccess(clubMembers,clubMembers.size());
    }

    /**
     * 加入社团新成员
     * @param cId
     * @param uId
     * @return
     */
    @PostMapping("/clubMembers/{cId}/{uId}")
    public String addClubMember(@PathVariable("cId")int cId,@PathVariable("uId")int uId){
        try {
            clubMemberService.addClubMember(cId,uId);
            return JSON.toJSONString("success");
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 根据社团id和用户id删除社团成员
     * @param cId 社团id
     * @param uId 用户id
     * @return 是否删除成功
     */
    @DeleteMapping("/clubMembers/{cId}/{uId}")
    public String deleteClubMember(@PathVariable("cId") int cId,@PathVariable("uId") int uId){
        try {
            clubMemberService.deleteClubMember(cId,uId);
            return JSON.toJSONString("success");
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 修改社团成员级别
     * @param cId 社团id
     * @param uId 用户id
     * @param role 成员级别
     * @return 是否修改成功
     */
    @PutMapping("/clubMembers/{cId}/{uId}/{role}")
    public String updateClubMember(@PathVariable("cId") int cId,@PathVariable("uId") int uId,@PathVariable("role") int role){
        try {
            clubMemberService.updateClubMember(cId,uId,role);
            return JSON.toJSONString("success");
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }

    /**
     * 修改社团成员状态
     * @param cId 社团id
     * @param uId 用户id
     * @param status 成员状态
     * @return 是否修改成功
     */
    @PutMapping("/memberStatus/{cId}/{uId}/{status}")
    public String updateMemberStatus(@PathVariable("cId") int cId,@PathVariable("uId") int uId,@PathVariable("status") int status){
        try {
            clubMemberService.updateMemberStatus(cId,uId,status);
            return JSON.toJSONString("success");
        }catch (Exception e){
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }
    }
}
