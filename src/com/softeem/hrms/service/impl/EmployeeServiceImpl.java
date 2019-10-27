package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.EmployeeMapper;
import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Employee;
import com.softeem.hrms.service.EmployeeService;
import com.softeem.hrms.utils.PageUtils;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public boolean add(Employee employee) {
		int row = employeeMapper.insert(employee);
		return row > 0;
	}

	@Override
	public boolean update(Employee employee) {
		int row = employeeMapper.updateByPrimaryKeySelective(employee);
		return row > 0;
	}

	@Override
	public Employee queryById(int id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageModel queryByPage(PageModel pm) {
		List<Employee> list = employeeMapper.selectAll();
		return PageUtils.handler(pm, list);
	}

	@Override
	public boolean deleteById(int id) {
		int row = employeeMapper.deleteByPrimaryKey(id);
		return row > 0;
	}

}
