package com.srp.controller;

import com.alibaba.fastjson.JSON;
import com.srp.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * 返回成员级别（超级管理员、社长、普通管理员）
 */
@RestController
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 返回成员级别
     *
     * @param cId 社团id
     * @param uId 用户id
     * @return 成员级别
     */
    @GetMapping("/role/{cId}/{uId}")
    public String getRole(@PathVariable("cId") int cId, @PathVariable("uId") int uId) {

        int role;
        if (roleService.getRole(cId, uId) == null) {
            role = 3;
        } else {
            role = roleService.getRole(cId, uId);
        }
        return JSON.toJSONString(role);
    }
}
