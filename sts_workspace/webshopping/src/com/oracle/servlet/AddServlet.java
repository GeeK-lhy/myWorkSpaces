package com.oracle.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
 * Servlet implementation class AddServlet
 */
@WebServlet("/add.do")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn=request.getParameter("isbn");
		BookDao bd=new BookDao();
		Book book=bd.getBookById(Integer.valueOf(isbn));
		HttpSession session=request.getSession();
		
		User user=(User) session.getAttribute("user");
		if(user!=null) {
			Map<Integer,List<Object>>map=(Map<Integer, List<Object>>) session.getAttribute("goods");
				//map.put(isbn+":"+book.getBookName(),book.getPrice());
			List<Object>list=new ArrayList<Object>();
			list.add(book.getBookName());
			list.add(book.getPrice());
			list.add(1);
			map.put(Integer.valueOf(isbn), list);
			response.sendRedirect("select.do");
		}

		else {
			response.sendRedirect("login.html");
		}
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
