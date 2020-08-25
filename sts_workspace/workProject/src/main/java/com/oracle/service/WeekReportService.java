package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.WeekReportMapper;
import com.oracle.vo.WeekReport;

@Service
public class WeekReportService {
	
	@Autowired
		WeekReportMapper dao;
	public List<WeekReport> selectByUser(String manager_id){
		
		return dao.selectByUser(manager_id);
	}
	public 	void insertWeekReport (WeekReport weekReport) {
		dao.insertWeekReport(weekReport);
	}
	public void updateReportById(WeekReport weekReport) {
		dao.updateReportById(weekReport);
	}
	public void deleteReport ( int report_id) {
		dao.deleteReport(report_id);
	}
	public WeekReport selectById(int report_id) {
		return dao.selectById(report_id);
	}
	public List<WeekReport> selectByConditions(Map<String,String>map){
		return dao.selectByConditions(map);
	}
}
