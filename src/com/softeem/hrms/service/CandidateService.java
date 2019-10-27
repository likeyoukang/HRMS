package com.softeem.hrms.service;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Candidate;

public interface CandidateService {
	/**
	 * ��ѡ������
	 * @param attendance
	 * @return
	 */
	boolean add(Candidate candidate);
	
	/**
	 * �޸ĺ�ѡ����Ϣ ����Ƿ�¼���ֶΣ���¼���򽫺�ѡ����ӵ�Ա������
	 * @param attendance
	 * @return
	 */
	boolean update(Candidate candidate);
	
	/**
	 * ����ID��ʾ��ѡ������
	 * @param id
	 * @return
	 */
	Candidate queryById(int id);
	
	/**
	 * ��ҳ��ѯ��ѡ�� subListʵ��α��ҳ
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
