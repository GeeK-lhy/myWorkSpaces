package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.dao.BookDao;
import com.oracle.dao.CommonDaoImp;
import com.oracle.vo.Book;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/addBook.do")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String bookName=request.getParameter("bookName");
		String price=request.getParameter("price");
		Book book=new Book(bookName,Integer.valueOf(price));
//		BookDao bd=new BookDao();
//		bd.add(book);
		CommonDaoImp cdi=new CommonDaoImp();
		cdi.insert(book);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<head><title>登陆成功</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table width='90%' border='1'>");

		//List<Book> list=bd.getAll();
			List<Book> list=cdi.query(Book.class);
		out.println("<tr>");
		out.println("<td>序号</td>");
		out.println("<td>书号</td>");
		out.println("<td>书名</td>");
		out.println("<td>价格</td>");
		out.println("</tr>");
		for(int i=0;i<list.size();i++) {
			
			out.print("<tr>");
			out.println("<td>");
			out.println(i+1);
			out.println("</td>");
			out.println("<td>");
			out.println(list.get(i).getIsbn());
			out.println("</td>");
			out.println("<td>");
			out.println(list.get(i).getBookName());
			out.println("</td>");
			out.println("<td>");
			out.println(list.get(i).getPrice());
			out.println("</td>");
//			out.println("<td><input type='button'value='删除'></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<a href='addBook.html'>");
		out.println("<a href='adBook.html'>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
