package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.dao.UserDao;
import com.oracle.vo.User;

/**
 * Servlet implementation class UserNameServlet
 */
@WebServlet("/user.do")
public class UserNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName=request.getParameter("userName");
		UserDao dao=new UserDao();
		User user=dao.getUserByName(userName);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(user!=null) {
			out.println("1.用户名已存在，请重新输入");
		}
		else {
			out.println("2.用户名可以使用");
		}
	}

}
