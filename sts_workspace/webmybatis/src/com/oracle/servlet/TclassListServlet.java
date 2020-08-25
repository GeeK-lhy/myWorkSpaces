package com.oracle.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.TclassService;
import com.oracle.vo.Tclass;

/**
 * Servlet implementation class TclassListServlet
 */
@WebServlet("/classList.do")
public class TclassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TclassService service=new TclassService();
		List<Tclass> list=service.getClassDetail();
		request.setAttribute("list", list);
		request.getRequestDispatcher("classList.jsp").forward(request, response);
		
	}

}
