package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.EmpService;
import com.oracle.vo.Emp;

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
		//获得用户名和密码;
		String empNo=request.getParameter("empNo");
		String password=request.getParameter("password");
		EmpService service=new EmpService();
		Emp emp=service.login(empNo, password);
		if(emp!=null) {
			request.getSession().setAttribute("Emp", emp);
		//	request.getRequestDispatcher("index.jsp").forward(request,response);
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("login.html");
		}
	}

}
