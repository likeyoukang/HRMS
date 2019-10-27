package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBase;

public interface SalaryBaseService {
	
	/**
	 * ��������
	 * @param attendance
	 * @return
	 */
	boolean add(SalaryBase salaryBase);

	/**
	 * �޸Ĺ�����Ϣ
	 * 
	 * @param attendance
	 * @return
	 */
	boolean update(SalaryBase salaryBase);

	/**
	 * ����ID��ʾ��������
	 * 
	 * @param id
	 * @return
	 */
	SalaryBase queryById(int id);

	/**
	 * ��ҳ��ѯ���� subListʵ��α��ҳ
	 * @return
	 */
	PageModel queryByPage(PageModel pm);

	/**
	 * ����IDɾ��������Ϣ
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
