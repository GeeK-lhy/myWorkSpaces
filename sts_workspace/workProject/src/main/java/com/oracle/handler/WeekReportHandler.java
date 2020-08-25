package com.oracle.handler;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.service.WeekReportService;
import com.oracle.vo.User;
import com.oracle.vo.WeekReport;

@Controller
public class WeekReportHandler {
	@Autowired
	WeekReportService wrs;
	
	//上报
	@RequestMapping("/tosubmitReport")
	public String tosubmitReport(HashMap<String,Object>map,WeekReport wr,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userInfo");
		if(user!=null) {
			map.put("manager", user.getUser_name());
			map.put("manager_id", user.getJob_number());
		}
		return "report";
	}
	
	
	
	@RequestMapping("/submitReport")
	@ResponseBody
	public String submitReport(WeekReport wr,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(wr!=null) {
		User user=(User) session.getAttribute("user");
		wr.setReport_time(new Date());
//		wr.setManager(user.getUser_name());
//		wr.setManager_id(user.getJob_number());
		wrs.insertWeekReport(wr);
		}
		return "success";
	
		
		
	}
	
	
	//查询
	
	@RequestMapping("/selectReports")
	public String selectReports(HttpServletRequest request,Map<String,Object>map) {
		HttpSession session =request.getSession();
		User user=(User) session.getAttribute("userInfo");
//		System.out.println(user.toString());
		if(user!=null) {
		String manager_id=user.getJob_number();
		List<WeekReport> list = wrs.selectByUser(manager_id);
		System.out.println(list.size());
		map.put("list", list);
		}
		return "reportList";
	}
	//详情
	@RequestMapping("/toDetails")
	public String toDetails(String flags,String report_id,HttpServletRequest request,Map<String,Object> map) {
		if(request.getAttribute("report_id")!=null) {
			WeekReport wr=wrs.selectById(Integer.valueOf(report_id));
			map.put("report",wr );
			map.put("flags", flags);
	
		}else if(report_id!=null){
		int id=Integer.valueOf(report_id);
		WeekReport wr=wrs.selectById(id);
		map.put("report",wr );
		map.put("flags", flags);
		}
		return "reportDetails";
	}
	//修改
	@RequestMapping("/toUpdate")
	public String toUpdate(String report_id,Map<String,Object>map) {
		WeekReport wr=wrs.selectById(Integer.valueOf(report_id));
		map.put("report", wr);
		map.put("report_id", report_id);
		map.put("manager",wr.getManager());
		map.put("manager_id", wr.getManager_id());
		return "updateReport";
	}
	@RequestMapping("/update")
	public String update(HttpServletRequest request,WeekReport wr,Map<String,Object>map) {
		System.out.println(wr.toString());
		wrs.updateReportById(wr);
		request.setAttribute("report_id", wr.getReport_id());
		return "redirect:/selectReports";
	}
	
	//删除
	@RequestMapping("/delete")
	public String delete(String report_id) {
		wrs.deleteReport(Integer.valueOf(report_id));
		return "redirect:/selectReports";
	}
	
	@RequestMapping("/toSelectByConditions")
	public String toSelectByConditions() {
		
		return "selectByConditions";
	}
	@RequestMapping("/selectByConditions")
	public String selectByConditions(String user_name,String title,Map<String,Object>map) {
		HashMap<String,String> m=new HashMap<String,String>();
		m.put("user_name", user_name);
		m.put("title", title);
		List<WeekReport>list=wrs.selectByConditions(m);
		map.put("list", list);
		return "conditionReport";
	}
	
}
