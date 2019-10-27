package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.SalaryBaseMapper;
import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBase;
import com.softeem.hrms.service.SalaryBaseService;
import com.softeem.hrms.utils.PageUtils;

@Service
public class SalaryBaseServiceImpl implements SalaryBaseService {
	
	@Autowired
	private SalaryBaseMapper salaryBaseMapper;
	
	@Override
	public boolean add(SalaryBase salaryBase) {
		int row = salaryBaseMapper.insert(salaryBase);
		return row > 0;
	}

	@Override
	public boolean update(SalaryBase salaryBase) {
		int row = salaryBaseMapper.updateByPrimaryKeySelective(salaryBase);
		return row > 0;
	}

	@Override
	public SalaryBase queryById(int id) {
		return salaryBaseMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageModel queryByPage(PageModel pm) {
		List<SalaryBase> list = salaryBaseMapper.selectAll();
		return PageUtils.handler(pm, list);
	}

	@Override
	public boolean deleteById(int id) {
		int row = salaryBaseMapper.deleteByPrimaryKey(id);
		return row > 0;
	}

}
