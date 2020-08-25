package com.oracle.vo;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
public class PageInfo {
	Integer recordCount;
	Integer currentPage=1;
	Integer pageSize=3;
	List<Object> list;
	public Integer getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
	public Integer getPageCount() {
		return this.recordCount%this.pageSize==0?this.recordCount/this.pageSize:(this.recordCount%this.pageSize)+1;
	}
	public PageInfo(HttpServletRequest request) {
		if(request.getParameter("currentPage")!=null)
	this.currentPage=Integer.valueOf(request.getParameter("currentPage"));
		request.setAttribute("pageInfo", this);
	}
	
}
