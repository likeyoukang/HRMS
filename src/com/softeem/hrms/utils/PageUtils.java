package com.softeem.hrms.utils;

import java.util.List;

import com.softeem.hrms.dto.PageModel;

/**
 * ��ҳ����(α��ҳ)
 * @author MR.��
 */
public class PageUtils {

	public static PageModel handler(PageModel pm, List list) {
			//��ȡ�ܼ�¼��
			pm.setTotalNum(list.size());
			//�����ȡ��ҳ��
			int totalPage = (int)Math.ceil(new Integer(list.size()).doubleValue()/pm.getPageSize());
			pm.setTotalPage(totalPage);
			//βҳ��Ϊ��ҳ��
			pm.setLast(totalPage);
			//��ֹ������һҳ
			int currentPage = pm.getCurrentPage() < 1 ? 1 : pm.getCurrentPage();
			currentPage = pm.getCurrentPage() > totalPage ? totalPage : currentPage;
			//�������õ�ǰҳ
			pm.setCurrentPage(currentPage);
			pm.setPrev(currentPage - 1);
			pm.setNext(currentPage + 1);
			
			//����߽�
			int from = (pm.getCurrentPage() - 1) * pm.getPageSize();
			int to  = pm.getCurrentPage() * pm.getPageSize();

			//��ֹԽ��
			from = from < 0 ? 0 : from;
			to = to > list.size() ? list.size() : to;
			list = list.subList(from, to);
			pm.setList(list);
			
			return pm;
	}
}
