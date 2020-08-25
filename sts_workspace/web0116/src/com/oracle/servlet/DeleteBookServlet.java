package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.BookDao;
import com.oracle.vo.User;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/delete.do")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
//		if(user!=null) {
		String []ids=request.getParameterValues("isbn");
		BookDao dao=new BookDao();
		Integer []isbns=new Integer[ids.length];
		for(int i=0;i<isbns.length;i++) {
			isbns[i]=Integer.valueOf(ids[i]);
		}
		
		dao.delete(isbns);
		int size=(int) session.getAttribute("size");
		if((size-isbns.length)%4==0) {
			int n=(int) session.getAttribute("page");
			session.setAttribute("page",n-1);
		}
		response.sendRedirect("bookList.do");
//		}else {
//			response.sendRedirect("login.jsp");
//		}
		
	}

}
