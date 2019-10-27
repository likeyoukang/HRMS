package com.softeem.hrms.dao;

import java.util.List;

import com.softeem.hrms.entity.Attendance;
import com.softeem.hrms.entity.Candidate;

public interface CandidateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Candidate record);

    int insertSelective(Candidate record);

    Candidate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Candidate record);

    int updateByPrimaryKey(Candidate record);
    
    List<Candidate> selectAll();
}