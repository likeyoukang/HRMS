package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBonus;

public interface SalaryBonusService {
	/**
	 * ????????
	 * @param attendance
	 * @return
	 */
	boolean add(SalaryBonus salaryBonus);

	/**
	 * ?????????
	 * 
	 * @param attendance
	 * @return
	 */
	boolean update(SalaryBonus salaryBonus);

	/**
	 * ????ID???????????
	 * 
	 * @param id
	 * @return
	 */
	SalaryBonus queryById(int id);

	/**
	 *
	 * @return
	 */
	PageModel queryByPage(PageModel pm);

	/**
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
