package com.oracle.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class WeekReport {
	private int report_id;
	private String title;
	private String manager;//������
	private String manager_id;
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date report_time;
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date plan_btime;//�ƻ���ʼʱ��
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date plan_etime;//�ƻ�����ʱ��
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date actual_btime;//ʵ�ʿ�ʼʱ��
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date actual_etime;//ʵ�ʽ���ʱ��
	private	String remark;//��ע
	private String  work_content;
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public Date getPlan_btime() {
		return plan_btime;
	}
	public void setPlan_btime(Date plan_btime) {
		this.plan_btime = plan_btime;
	}
	public Date getPlan_etime() {
		return plan_etime;
	}
	public void setPlan_etime(Date plan_etime) {
		this.plan_etime = plan_etime;
	}
	public Date getActual_btime() {
		return actual_btime;
	}
	public void setActual_btime(Date actual_btime) {
		this.actual_btime = actual_btime;
	}
	public Date getActual_etime() {
		return actual_etime;
	}
	public void setActual_etime(Date actual_etime) {
		this.actual_etime = actual_etime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	@Override
	public String toString() {
		return "WeekReport [report_id=" + report_id + ", title=" + title + ", manager=" + manager + ", manager_id="
				+ manager_id + ", report_time=" + report_time + ", plan_btime=" + plan_btime + ", plan_etime="
				+ plan_etime + ", actual_btime=" + actual_btime + ", actual_etime=" + actual_etime + ", remark="
				+ remark + ", work_content=" + work_content + "]";
	}
	
}
