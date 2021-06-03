package com.baiyun.test.service.impl;

import com.baiyun.test.mapper.CollegeMapper;
import com.baiyun.test.service.CollegeService;
import com.baiyun.test.po.College;
import com.baiyun.test.po.CollegeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeMapper collegeMapper;

    @Cacheable(value = "collegeList",key = "methodName")
    public List<College> finAll() throws Exception {
        CollegeExample collegeExample = new CollegeExample();
        CollegeExample.Criteria criteria = collegeExample.createCriteria();

        criteria.andCollegeidIsNotNull();
        System.out.println("------------------------------------查询数据库");

        return collegeMapper.selectByExample(collegeExample);
    }
}
