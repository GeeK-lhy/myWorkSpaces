package com.oracle.servlet;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.TclassService;
import com.oracle.vo.Tclass;

/**
 * Servlet implementation class ClassInforServlet
 */
@WebServlet("/classInfor.do")
public class ClassInforServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classId=request.getParameter("classId");
		if(classId==null) {
			classId="0";
		}
		
		TclassService service=new TclassService();
		List<Tclass> list=service.getClassDetail();
		response.setContentType("text/html;charset=UTF-8");	
		StringBuffer sb=new StringBuffer("<option value='0'>²»ÏÞ</option>");
		for(Tclass tc:list) {
			if(Integer.valueOf(classId)==tc.getClassId()) {
				sb.append("<option value='").append(tc.getClassId()+"' selected>").append(tc.getClassName()).append("</option>");
			}else {
				sb.append("<option value='").append(tc.getClassId()+"' >").append(tc.getClassName()).append("</option>");
		
			}
		}
		response.getWriter().println(sb.toString());;
	}

}
