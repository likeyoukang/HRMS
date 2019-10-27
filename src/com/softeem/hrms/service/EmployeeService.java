package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Employee;

public interface EmployeeService {
	
	/**
	 * 员工新增
	 * 
	 * @param attendance
	 * @return
	 */
	boolean add(Employee employee);

	/**
	 * 修改员工信息
	 * 
	 * @param attendance
	 * @return
	 */
	boolean update(Employee employee);

	/**
	 * 根据ID显示员工详情
	 * 
	 * @param id
	 * @return
	 */
	Employee queryById(int id);

	/**
	 * 分页查询员工 subList实现伪分页
	 * @return
	 */
	PageModel queryByPage(PageModel pm);

	/**
	 * 根据ID删除员工信息
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
