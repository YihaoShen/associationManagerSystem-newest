package com.srp.service;

public interface RoleService {
    /**
     * 获取用户权限等级
     * @param cId 社团id
     * @param uId 用户id
     * @return 权限等级
     */
    Integer getRole(int cId,int uId);
}
