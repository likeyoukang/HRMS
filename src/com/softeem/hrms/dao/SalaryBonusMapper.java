package com.softeem.hrms.dao;

import java.util.List;

import com.softeem.hrms.entity.SalaryBase;
import com.softeem.hrms.entity.SalaryBonus;

public interface SalaryBonusMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(SalaryBonus record);

    int insertSelective(SalaryBonus record);

    SalaryBonus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SalaryBonus record);

    int updateByPrimaryKey(SalaryBonus record);
    
    List<SalaryBonus> selectAll();
}