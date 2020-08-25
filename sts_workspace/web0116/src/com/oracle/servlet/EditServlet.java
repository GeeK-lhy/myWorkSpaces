package com.oracle.servlet;

import java.io.IOException;
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
 * Servlet implementation class EditServlet
 */
@WebServlet("/edit.do")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
//		if(user!=null) {
		String isbn=request.getParameter("isbn");
		BookDao dao=new BookDao();
		Book b=dao.getBookById(Integer.valueOf(isbn));
		request.setAttribute("updateBook", b);
		request.getRequestDispatcher("edit.jsp").forward(request, response);
//		}
//		else {
//			response.sendRedirect("login.jsp");
//		}
	}

}
