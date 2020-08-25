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
import com.oracle.vo.User;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/bookList.do")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		BookDao dao=new BookDao();
		int p=(int)session.getAttribute("page");
		int size=dao.getCount();
		List<Book> pageList=dao.getByPage(p,4);
		session.setAttribute("size", size);
		session.setAttribute("books", pageList);
		request.getRequestDispatcher("bookList.jsp").forward(request,response);
		
	}
		

}
