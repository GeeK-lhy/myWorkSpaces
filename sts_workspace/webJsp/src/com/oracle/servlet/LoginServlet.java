package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.UserDao;
import com.oracle.vo.User;

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
			UserDao dao=new UserDao();
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			User user=dao.gatAll(userName, password);
			if(user!=null) {
				HttpSession session=request.getSession();
				
				session.setAttribute("user", user);
				dao.userLogin(user.getUserid());
				session.setAttribute("page", 1);
				response.sendRedirect("bookList.do");
			}
			else {
				response.sendRedirect("login.jsp");
			}
	}

}
