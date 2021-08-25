package com.srp.service;

import com.srp.bean.Club;
import com.srp.bean.ClubMember;
import com.srp.bean.User;

import java.util.List;

public interface ClubMemberService {
    /**
     * 查询所有社团成员
     * @param cId 社团id
     * @return 所有社团成员
     */
    List<ClubMember> selectAllClubMember(int cId);
    List<ClubMember> selectApplyMember(int cId);
    List<ClubMember> selectRoleMember(int cId);
    List<Club> selectAllClubByUid(int uId);
    List<ClubMember> selectClubMemberByNameAndNumber(int cId,String uName,String uStuNumber);

    /**
     * 添加社团新成员
     * @param cId
     * @param uId
     */
    void addClubMember(int cId,int uId);
    /**
     * 删除社团成员
     * @param cId 社团id
     * @param uId 用户id
     */
    void deleteClubMember(int cId, int uId);
    /**
     * 修改社团成员级别
     * @param cId 社团id
     * @param uId 用户id
     * @param role 成员级别
     */
    void updateClubMember(int cId, int uId, int role);
    void updateMemberStatus(int cId, int uId, int status);
}
