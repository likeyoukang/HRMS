package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.SalaryBonusMapper;
import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBonus;
import com.softeem.hrms.service.SalaryBonusService;
import com.softeem.hrms.utils.PageUtils;

@Service
public class SalaryBonusServiceImpl implements SalaryBonusService {
	
	@Autowired
	private SalaryBonusMapper salaryBonusMapper;
	
	@Override
	public boolean add(SalaryBonus salaryBonus) {
		int row = salaryBonusMapper.insert(salaryBonus);
		return row > 0;
	}

	@Override
	public boolean update(SalaryBonus salaryBonus) {
		int row = salaryBonusMapper.updateByPrimaryKeySelective(salaryBonus);
		return row > 0;
	}

	@Override
	public SalaryBonus queryById(int id) {
		return salaryBonusMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageModel queryByPage(PageModel pm) {
		List<SalaryBonus> list = salaryBonusMapper.selectAll();
		return PageUtils.handler(pm, list);
	}

	@Override
	public boolean deleteById(int id) {
		int row = salaryBonusMapper.deleteByPrimaryKey(id);
		return row > 0;
	}

}
