package com.srp.service.impl;

import com.srp.dao.RoleMapper;
import com.srp.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Integer getRole(int cId, int uId) {
        return roleMapper.getRole(cId,uId);
    }
}
