package com.srp.dao;

import com.srp.bean.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User getuPhoto(int uId);
    int deleteByPrimaryKey(@Param("uId") Integer uId, @Param("uStuNumber") String uStuNumber);

    int insert(User record);

    User selectByPrimaryKey(@Param("uId") Integer uId, @Param("uStuNumber") String uStuNumber);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
}