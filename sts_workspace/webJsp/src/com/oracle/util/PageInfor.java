package com.oracle.util;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PageInfor {
	int  recordCount=0; //记录总数；
	int  currentPage=1;//当前页码；
	int  pageSize=4;  //每页数量；
	List<Object> list=new ArrayList<Object>(); //当页的数据
	String url=null;
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
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
		return  this.recordCount%this.pageSize==0? this.recordCount/this.pageSize:this.recordCount/this.pageSize+1;
		
	}
	public PageInfor(HttpServletRequest request) {
		if(request.getParameter("currentPage")!=null) {
			this.currentPage=Integer.valueOf(request.getParameter("currentPage"));
		}
		this.url=request.getRequestURL().toString();
		request.setAttribute("pageInfor", this);
	}
}
