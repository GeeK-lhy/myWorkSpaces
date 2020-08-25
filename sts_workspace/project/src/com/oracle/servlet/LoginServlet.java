package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.EmpService;
import com.oracle.vo.Emp;
import com.oracle.vo.PageInfo;

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
		String auto=request.getParameter("auto");
		EmpService service=new EmpService();
		Emp emp=service.login(empNo, password);
			
		if(auto!=null) {
			Cookie c1=new Cookie("empNo", empNo);
			Cookie c2=new Cookie("password",password);
		c1.setMaxAge(Integer.valueOf(auto));
		c2.setMaxAge(Integer.valueOf(auto));
		response.addCookie(c1);
		response.addCookie(c2);
		}
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
