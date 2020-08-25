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
 * Servlet implementation class NextServlet
 */
@WebServlet("/next.do")
public class NextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
//		if(user!=null) {
		int n=(int)session.getAttribute("size");
		int p=(int)session.getAttribute("page");
		if(p<n/4) {
		session.setAttribute("page", p+1);
		response.sendRedirect("bookList.do");
		}else {
		response.sendRedirect("last.do");
		}
//		}else {
//			response.sendRedirect("login.do");
//		}
	}

}
