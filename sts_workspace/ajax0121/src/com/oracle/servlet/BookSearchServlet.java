package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.dao.BookDao;
import com.oracle.vo.Book;

/**
 * Servlet implementation class BookSearchServlet
 */
@WebServlet("/book.do")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao dao=new BookDao();
		String isbn=request.getParameter("isbn");
		Book book=dao.getBookById(Integer.valueOf(isbn));
		StringBuffer str=new StringBuffer("{");
		if(book!=null) {
			str.append("\"isbn\":\""+book.getIsbn()+"\",");
			str.append("\"bookName\":\""+book.getBookName()+"\",");
			str.append("\"price\":\""+book.getPrice()+"\"}");
		}else {
			str.append("}");
		}
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(str.toString());
	}

}
