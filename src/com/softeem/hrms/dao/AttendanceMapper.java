package com.softeem.hrms.dao;

import java.util.List;

import com.softeem.hrms.entity.Attendance;

public interface AttendanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    Attendance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);
    
    List<Attendance> selectAll();
}