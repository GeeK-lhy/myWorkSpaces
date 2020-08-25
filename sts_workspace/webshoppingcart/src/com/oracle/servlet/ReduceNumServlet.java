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
import com.oracle.vo.ShoppingCart;

/**
 * Servlet implementation class ReduceNumServlet
 */
@WebServlet("/reduce.do")
public class ReduceNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		BookDao dao=new BookDao();
		String isbn=request.getParameter("isbn");
	//	Book b=dao.getBookById(Integer.valueOf(isbn));
		ShoppingCart cart=(ShoppingCart) session.getAttribute("cart");
		cart.reduce(Integer.valueOf(isbn));
		session.setAttribute("cart",cart);
		response.setContentType("text/plain;charset=UTF-8");
		response.sendRedirect("cart.jsp");
	}

}
