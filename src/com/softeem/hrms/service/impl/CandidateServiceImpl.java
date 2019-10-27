package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.CandidateMapper;
import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Candidate;
import com.softeem.hrms.service.CandidateService;
import com.softeem.hrms.utils.PageUtils;

@Service("candidateService")
public class CandidateServiceImpl implements CandidateService{
	
	@Autowired
	private CandidateMapper candidateMapper;

	@Override
	public boolean add(Candidate candidate) {
		int row = candidateMapper.insert(candidate);
		return row > 0;
	}

	@Override
	public boolean update(Candidate candidate) {
		int row = candidateMapper.updateByPrimaryKeySelective(candidate);
		return row > 0;
	}

	@Override
	public Candidate queryById(int id) {
		return candidateMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageModel queryByPage(PageModel pm) {
		List<Candidate> list = candidateMapper.selectAll();
		return PageUtils.handler(pm, list);
	}

	@Override
	public boolean deleteById(int id) {
		int row = candidateMapper.deleteByPrimaryKey(id);
		return row > 0;
	}

}
