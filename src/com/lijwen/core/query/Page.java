package com.lijwen.core.query;


import java.util.ArrayList;
import java.util.List;


public class Page<T> {
	
	//页面大小
	public int pageSize = 5;
	//当前页数
	public int currentPage = 1;
	//总数
	public long total;
	//结果集
	public List<T> result = new ArrayList<T>();
	
	public int start=1;
	public int end=5;
	
	

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getResult() {
		return result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}
	/**
	 * 获取总页数
	 * */
	public long getTotalPage() {
		return this.total%this.pageSize != 0 ? this.total/this.pageSize + 1 : this.total/this.pageSize;
	}
	/**
	 * 设置可见页  默认值为5
	 * */
	public void visiblePages() {
		int visiblePages = 5;
		int totalPages =(int)getTotalPage();
		if (visiblePages > totalPages) {
			visiblePages = totalPages;
		}
		int half = (int) Math.floor(visiblePages / 2);
		int start = getCurrentPage() - half + 1 - visiblePages % 2;
		int end = getCurrentPage() + half;

		if (start < 1) {
			start = 1;
			end = visiblePages;
		}
		if (end > totalPages) {
			end = totalPages;
			start = 1 + totalPages - visiblePages;
		}
		setStart(start);
		setEnd(end);
	}
}
