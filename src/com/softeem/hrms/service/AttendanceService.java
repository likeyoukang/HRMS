package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Attendance;

public interface AttendanceService {

	/**
	 * 考勤信息新增
	 * @param attendance
	 * @return
	 */
	boolean add(Attendance attendance);
	
	/**
	 * 修改考勤信息
	 * @param attendance
	 * @return
	 */
	boolean update(Attendance attendance);
	
	/**
	 * 根据ID显示员工考勤详情
	 * @param id
	 * @return
	 */
	Attendance queryById(int id);
	
	/**
	 * 分页查询  subList实现伪分页
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
