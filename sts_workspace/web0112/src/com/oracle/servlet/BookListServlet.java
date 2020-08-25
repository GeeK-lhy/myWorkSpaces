package com.oracle.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.vo.Book;

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
		List<String> list=new ArrayList<String>();
		list.add("LHY");
		list.add("wyj");
		list.add("wpp");
		request.setAttribute("names", list);
		Book b=new Book(null,"java",40);
		request.setAttribute("book",b );
		//页面转发
		//分发器
		RequestDispatcher rd=request.getRequestDispatcher("bookList.jsp");
		rd.forward(request, response);
	
	}

}
