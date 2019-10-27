package com.softeem.hrms.dao;

import java.util.List;

import com.softeem.hrms.entity.Candidate;
import com.softeem.hrms.entity.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    List<Employee> selectAll();
}