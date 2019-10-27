package com.softeem.hrms.service;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Candidate;

public interface CandidateService {
	/**
	 * 候选人新增
	 * @param attendance
	 * @return
	 */
	boolean add(Candidate candidate);
	
	/**
	 * 修改候选人信息 检测是否录用字段，若录用则将候选人添加到员工表中
	 * @param attendance
	 * @return
	 */
	boolean update(Candidate candidate);
	
	/**
	 * 根据ID显示候选人详情
	 * @param id
	 * @return
	 */
	Candidate queryById(int id);
	
	/**
	 * 分页查询候选人 subList实现伪分页
	 * @return
	 */
	PageModel queryByPage(PageModel pm);
	
	/**
	 * 根据ID删除员工考勤信息
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
