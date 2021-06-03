package com.baiyun.test.service.impl;

import com.baiyun.test.service.RoleService;
import com.baiyun.test.mapper.RoleMapper;
import com.baiyun.test.po.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public Role findByid(Integer id) throws Exception {
        return roleMapper.selectByPrimaryKey(id);
    }
}
