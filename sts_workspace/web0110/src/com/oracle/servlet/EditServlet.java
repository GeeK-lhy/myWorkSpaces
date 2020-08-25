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
 * Servlet implementation class EditServlet
 */
@WebServlet("/edit.do")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn=request.getParameter("isbn");
		BookDao bd=new BookDao();
		Book book=bd.getBookById(Integer.valueOf(isbn));
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>编辑</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<form action='update.do' method='post'>");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td></td>");
		out.println("<td><input type='hidden' name='isbn' value='"+book.getIsbn()+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>图书名称:</td>");
		out.println("<td><input type='text' name='bookName' value='"+book.getBookName()+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>图书价格:</td>");
		out.println("<td><input type='text' name='price' value='"+book.getPrice()+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td colspan='2' align='right'><input type='submit' value='提交'></td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
	}

}
