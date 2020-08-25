package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.dao.CityDao;
import com.oracle.vo.City;

/**
 * Servlet implementation class CityServlet
 */
@WebServlet("/city.do")
public class CityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CityDao dao=new CityDao();
		List<City>list=new ArrayList<City>();
		String s=request.getParameter("pid");
		ObjectMapper mapper=new ObjectMapper();
//		if(!s.equals("0")) 
//		{
//			list=dao.getByParent(s);
//		}
//		else {
//			list=dao.getCountry();
//		}
		if(s.equals("")) {
			list=dao.getCountry();
		}else {
		list=dao.getByParent(s);
		}
		String json=mapper.writeValueAsString(list);
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println(json);
		out.println(json);
		
		
	}

}
