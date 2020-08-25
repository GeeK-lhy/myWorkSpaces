package com.oracle.vo;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
public class PageInfor {
	int recordCount;
	int pageSize=5;
	int currentPage=1;
	List<Object>list=new ArrayList<Object>();
	String url=null;
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
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
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPageCount() {
	return this.recordCount%this.pageSize==0?this.recordCount/this.pageSize:this.recordCount/this.pageSize+1;
	}
	public PageInfor(HttpServletRequest request) {
		if(request.getParameter("currentPage")!=null)
	this.currentPage=Integer.valueOf(request.getParameter("currentPage"));
		this.url=request.getRequestURL().toString();
		request.setAttribute("pageInfor", this);
	}
	
}
