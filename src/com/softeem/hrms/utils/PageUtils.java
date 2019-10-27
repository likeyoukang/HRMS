package com.softeem.hrms.utils;

import java.util.List;

import com.softeem.hrms.dto.PageModel;

/**
 * 分页工具(伪分页)
 * @author MR.柴
 */
public class PageUtils {

	public static PageModel handler(PageModel pm, List list) {
			//获取总记录数
			pm.setTotalNum(list.size());
			//计算获取总页数
			int totalPage = (int)Math.ceil(new Integer(list.size()).doubleValue()/pm.getPageSize());
			pm.setTotalPage(totalPage);
			//尾页即为总页数
			pm.setLast(totalPage);
			//防止无限上一页
			int currentPage = pm.getCurrentPage() < 1 ? 1 : pm.getCurrentPage();
			currentPage = pm.getCurrentPage() > totalPage ? totalPage : currentPage;
			//重新设置当前页
			pm.setCurrentPage(currentPage);
			pm.setPrev(currentPage - 1);
			pm.setNext(currentPage + 1);
			
			//计算边界
			int from = (pm.getCurrentPage() - 1) * pm.getPageSize();
			int to  = pm.getCurrentPage() * pm.getPageSize();

			//防止越界
			from = from < 0 ? 0 : from;
			to = to > list.size() ? list.size() : to;
			list = list.subList(from, to);
			pm.setList(list);
			
			return pm;
	}
}
