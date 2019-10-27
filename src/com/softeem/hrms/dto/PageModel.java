package com.softeem.hrms.dto;

import java.util.List;

/**
 * ͨ�÷�ҳģ��
 * @author MR.��
 */
public class PageModel {
	/** ��ǰҳ*/
	private int currentPage;
	/**ÿҳ��С*/
	private int pageSize=10;
	
	/** �ܼ�¼��������*/
	private int totalNum;
	/** ��ҳ��*/
	private int totalPage;
	/** ��һҳ*/
	private int prev;
	/** ��һҳ*/
	private int next;
	/** ��ҳ*/
	private int first=1;
	/** βҳ*/
	private int last;

	/** ����*/
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
