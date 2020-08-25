package com.oracle.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.BookDao;
import com.oracle.vo.Book;

/**
 * Servlet implementation class SelectSerclet
 */
@WebServlet("/select.do")
public class SelectSerclet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String str=request.getParameter("selectName");
		BookDao dao=new BookDao();
		List<Book> list=dao.select(str);
		request.setAttribute("selectBook", list);
		//session.setAttribute("size", list.size());
		request.getRequestDispatcher("select.jsp").forward(request,response);
	}

}
