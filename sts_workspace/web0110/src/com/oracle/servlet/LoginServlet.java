package com.oracle.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
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
		Cookie c=new Cookie("userName",user.getUserName());
		Cookie c1=new Cookie("password",password);
		if(age!=null) {
			
			c.setMaxAge(Integer.valueOf(age));
			c1.setMaxAge(Integer.valueOf(age));
			response.addCookie(c);
			response.addCookie(c1);
		}
		//获得上下文：
			ServletContext context=request.getServletContext();
			// "/"代表当前项目的根目录
			String path=context.getRealPath("/");
			System.out.println(path);
			String contextPath=context.getContextPath();
			System.out.println(contextPath);
			Integer count=(Integer)context.getAttribute("count");
			if(count==null) {
				count=0;
			}
			count++;
			context.setAttribute("count", count);
			
			//
			if(user!=null) {
			HttpSession session=request.getSession();
			//session.setMaxInactiveInterval(10);
			System.out.println("session id :"+session.getId());
			System.out.println("最大间隔："+session.getMaxInactiveInterval());
			System.out.println("创建时间："+session.getCreationTime());
			session.setAttribute("user", user);
		//	session.invalidate();
			response.sendRedirect("select.do");
		}else {
			response.sendRedirect("login.html");
		}
	}

}
