package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Attendance;

public interface AttendanceService {

	/**
	 * ������Ϣ����
	 * @param attendance
	 * @return
	 */
	boolean add(Attendance attendance);
	
	/**
	 * �޸Ŀ�����Ϣ
	 * @param attendance
	 * @return
	 */
	boolean update(Attendance attendance);
	
	/**
	 * ����ID��ʾԱ����������
	 * @param id
	 * @return
	 */
	Attendance queryById(int id);
	
	/**
	 * ��ҳ��ѯ  subListʵ��α��ҳ
	 * @return
	 */
	PageModel queryByPage(PageModel pm);
	
	/**
	 * ����IDɾ��Ա��������Ϣ
	 * @param id
	 * @return
	 */
	boolean deleteById(int id);
	
	
	
}
