package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Employee;

public interface EmployeeService {
	
	/**
	 * Ա������
	 * 
	 * @param attendance
	 * @return
	 */
	boolean add(Employee employee);

	/**
	 * �޸�Ա����Ϣ
	 * 
	 * @param attendance
	 * @return
	 */
	boolean update(Employee employee);

	/**
	 * ����ID��ʾԱ������
	 * 
	 * @param id
	 * @return
	 */
	Employee queryById(int id);

	/**
	 * ��ҳ��ѯԱ�� subListʵ��α��ҳ
	 * @return
	 */
	PageModel queryByPage(PageModel pm);

	/**
	 * ����IDɾ��Ա����Ϣ
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
}
