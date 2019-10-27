package com.softeem.hrms.dao;

import java.util.List;

import com.softeem.hrms.entity.Employee;
import com.softeem.hrms.entity.SalaryBase;

public interface SalaryBaseMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(SalaryBase record);

    int insertSelective(SalaryBase record);

    SalaryBase selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SalaryBase record);

    int updateByPrimaryKey(SalaryBase record);
    
    List<SalaryBase> selectAll();
    
}