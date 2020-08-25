package com.oracle.dao;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.WeekReport;

@Repository
public interface WeekReportMapper {
	
	List<WeekReport> selectByUser(@Param("manager_id")String manager_id);
	void insertWeekReport (WeekReport weekReport);
	void updateReportById(WeekReport weekReport);
	void deleteReport (@Param("report_id") int report_id);
	WeekReport selectById(@Param("report_id")int report_id);
	List<WeekReport> selectByConditions(Map<String,String>map);
}
