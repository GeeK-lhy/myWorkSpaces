package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.vo.User;

/**
 * Servlet implementation class LastServlet
 */
@WebServlet("/last.do")
public class LastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
//		if(user!=null) {
			int n=(int)session.getAttribute("size");
			if(n%4==0) {
		session.setAttribute("page",n/4);
			}
			else {
				session.setAttribute("page",(n/4)+1);
			}
		response.sendRedirect("bookList.do");
//		}
//		else {
//			response.sendRedirect("login.jsp");
//		}
	}

}
