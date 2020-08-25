package com.oracle.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.*;
import com.oracle.vo.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String age=request.getParameter("maxAge");
		UserDao ud=new UserDao();
		User user=ud.gatAll(userName, password);
		Cookie c=new Cookie("userName",userName);
		Cookie c1=new Cookie("password",password);
		if(age!=null) {
			c.setMaxAge(Integer.valueOf(age));
			c1.setMaxAge(Integer.valueOf(age));
			response.addCookie(c);
			response.addCookie(c1);
		}
	
		if(user!=null) {
			Map<Integer,List<Object>>map=new HashMap<Integer,List<Object>>();
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("goods", map);
			response.sendRedirect("select.do");
		}else {
			response.sendRedirect("login.html");
		}
	}

}
