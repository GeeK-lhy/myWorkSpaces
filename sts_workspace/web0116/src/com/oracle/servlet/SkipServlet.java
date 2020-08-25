package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SkipServlet
 */
@WebServlet("/skip.do")
public class SkipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String n=request.getParameter("skipPage");
		Integer i=(Integer) session.getAttribute("size");
		if(Integer.valueOf(n)*4<4+i) {
		session.setAttribute("page",Integer.valueOf(n));
		response.sendRedirect("bookList.do");
		}else {
			response.sendRedirect("last.do");
		}
	}

}
