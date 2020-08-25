package com.oracle.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;
import com.oracle.vo.Emp;
import com.oracle.vo.PageInfo;

/**
 * Servlet implementation class GetReceiveListServlet
 */
@WebServlet("/files/receiveMessageList.do")
public class GetReceiveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		MessageService ms=new MessageService();
		PageInfo pageInfo=new PageInfo(request);
		//按时间查询的起始和结束时间
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		
		int start=(pageInfo.getCurrentPage()-1)*pageInfo.getPageSize();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("empId", emp.getEmpId());
		map.put("start", start);
		map.put("pageSize", pageInfo.getPageSize());
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		
		List<Object>list=ms.getReceiveMessage(map);
		pageInfo.setList(list);
		pageInfo.setRecordCount(ms.getReceiveMessageRecordCount(map));
		request.setAttribute("list", list);
		request.setAttribute("startTime", startTime);
		request.setAttribute("endTime", endTime);
		request.getRequestDispatcher("receiveMessageList.jsp").forward(request, response);
	}

}
