package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		UserDao ud=new UserDao();
		User user=ud.gatAll(userName, password);
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
