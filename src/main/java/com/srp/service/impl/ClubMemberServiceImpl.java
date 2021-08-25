package com.srp.service.impl;

import com.srp.bean.Club;
import com.srp.bean.ClubMember;
import com.srp.bean.User;
import com.srp.dao.ClubMemberMapper;
import com.srp.service.ClubMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ClubMemberServiceImpl implements ClubMemberService {

    @Autowired
    private ClubMemberMapper clubMemberMapper;

    @Override
    public List<ClubMember> selectAllClubMember(int cId) {
        return clubMemberMapper.selectAllClubMember(cId);
    }

    @Override
    public List<ClubMember> selectApplyMember(int cId) {
        return clubMemberMapper.selectApplyMember(cId);
    }

    @Override
    public List<ClubMember> selectRoleMember(int cId) {
        return clubMemberMapper.selectRoleMember(cId);
    }

    @Override
    public List<Club> selectAllClubByUid(int uId) {
        return clubMemberMapper.selectAllClubByUid(uId);
    }

    @Override
    public List<ClubMember> selectClubMemberByNameAndNumber(int cId,String uName, String uStuNumber) {
        return clubMemberMapper.selectClubMemberByNameAndNumber(cId,uName,uStuNumber);
    }

    @Override
    public void addClubMember(int cId,int uId) {
        clubMemberMapper.addClubMember(cId,uId);
    }

    @Override
    public void deleteClubMember(int cId, int uId) {
        clubMemberMapper.deleteClubMember(cId,uId);
    }

    @Override
    public void updateClubMember(int cId, int uId, int role) {
        clubMemberMapper.updateClubMember(cId,uId,role);
    }

    @Override
    public void updateMemberStatus(int cId, int uId, int status) {
        clubMemberMapper.updateMemberStatus(cId,uId,status);
    }
}
