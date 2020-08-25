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
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/addBook.do")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
//		if(user!=null) {
		String bookName=request.getParameter("bookName");
		String price=request.getParameter("price");	
		System.out.println(price);
		Book b=new Book(bookName,Integer.valueOf(price));
		BookDao dao=new BookDao();
		dao.insert(b);
		 response.sendRedirect("bookList.do");

			
//		}
//		else {
//			response.sendRedirect("login.jsp");
//		}
	}

}
