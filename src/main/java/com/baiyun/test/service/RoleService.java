package com.baiyun.test.service;

import com.baiyun.test.po.Role;

/**
 *  Role 权限表Service层
 */
public interface RoleService {

    Role findByid(Integer id) throws Exception;

}
