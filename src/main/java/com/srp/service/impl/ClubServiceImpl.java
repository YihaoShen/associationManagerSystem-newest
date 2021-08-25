package com.srp.service.impl;

import com.srp.bean.Activity;
import com.srp.bean.Club;
import com.srp.dao.ClubDao;
import com.srp.dao.ClubMapper;
import com.srp.dao.impl.ClubDaoImpl;
import com.srp.service.ClubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ClubServiceImpl implements ClubService {

    @Autowired
    private ClubMapper clubMapper;

    @Override
    public List<Club> selectAllClub() {
        return clubMapper.selectAllClub();
    }

    @Override
    public List<Club> selectApplyClub() {
        return clubMapper.selectApplyClub();
    }

    @Override
    public List<Club> selectClubByFL(int first,int last) {
        return clubMapper.selectClubByFL(first,last);
    }

    @Override
    public int selectTotalClub() {
        return clubMapper.selectTotalClub();
    }

    @Override
    public Club selectClubById(int cId) {
        return clubMapper.selectClubById(cId);
    }

    @Override
    public void addClub(Club club) {
        clubMapper.addClub(club);
    }

    @Override
    public void deleteClub(int cId) {
        clubMapper.deleteClub(cId);
    }

    @Override
    public void agreeClub(int cId) {
        clubMapper.agreeClub(cId);
    }

    @Override
    public void updateClub(Club club) {
        clubMapper.updateClub(club);
    }

    private ClubDao clubDao = new ClubDaoImpl();

    @Override
    public Club showClubService(String cName) {
        Club club = clubDao.showClubDao(cName);
        System.out.println("club service:" + club);
        return club;
    }

    @Override
    public ArrayList<String> getClubNamesService() {
        return clubDao.getClubNamesDao();
    }

    @Override
    public ArrayList<Club> joinedClubService(String uName) {
        return clubDao.joinedClubDao(uName);
    }

    @Override
    public ArrayList<Activity> showClubActivityService(String cName) {
        return clubDao.showClubActivityDao(cName);
    }

    @Override
    public ArrayList<Activity> getAllActivityByUNameService(String uName) throws SQLException {
        return clubDao.getAllActivityByUNameDao(uName);
    }
}
