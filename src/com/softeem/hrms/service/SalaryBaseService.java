package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBase;

public interface SalaryBaseService {
	
	/**
	 * 工资新增
	 * @param attendance
	 * @return
	 */
	boolean add(SalaryBase salaryBase);

	/**
	 * 修改工资信息
	 * 
	 * @param attendance
	 * @return
	 */
	boolean update(SalaryBase salaryBase);

	/**
	 * 根据ID显示工资详情
	 * 
	 * @param id
	 * @return
	 */
	SalaryBase queryById(int id);

	/**
	 * 分页查询工资 subList实现伪分页
	 * @return
	 */
	PageModel queryByPage(PageModel pm);

	/**
	 * 根据ID删除工资信息
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
