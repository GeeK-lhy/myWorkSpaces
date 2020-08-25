package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.dao.CityDao;
import com.oracle.vo.City;

import java.util.*;
/**
 * Servlet implementation class ZoneServlet
 */
@WebServlet("/zone.do")
public class ZoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CityDao dao=new CityDao();
		String id=request.getParameter("id");
		List<City>list=dao.getZone(id);
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<list.size();i++) {
			sb.append("<option value="+list.get(i).getId()+">"+list.get(i).getName()+"</option>");
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(sb.toString());
	}	

}
