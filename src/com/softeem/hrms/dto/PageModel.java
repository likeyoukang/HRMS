package com.softeem.hrms.dto;

import java.util.List;

/**
 * 通用分页模型
 * @author MR.柴
 */
public class PageModel {
	/** 当前页*/
	private int currentPage;
	/**每页大小*/
	private int pageSize=10;
	
	/** 总记录数据行数*/
	private int totalNum;
	/** 总页数*/
	private int totalPage;
	/** 上一页*/
	private int prev;
	/** 下一页*/
	private int next;
	/** 首页*/
	private int first=1;
	/** 尾页*/
	private int last;

	/** 数据*/
	private List list;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "PageModel [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalNum=" + totalNum
				+ ", totalPage=" + totalPage + ", prev=" + prev + ", next=" + next + ", first=" + first + ", last="
				+ last + ", list=" + list + "]";
	}

	
}
