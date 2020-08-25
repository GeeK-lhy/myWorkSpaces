package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.*;
import com.oracle.vo.*;
/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			BookDao bd=new BookDao();
			List<Book> list=bd.getAll();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
		
			out.println("<html>");
			out.println("<head><title>登陆成功</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("session 创建时间:" +session.getCreationTime()+"</br>");
			out.println("session 的id:"+session.getId()+"</br>");
			out.println("session最大时间间隔:"+session.getMaxInactiveInterval()+"</br>");
		//	session.removeAttribute("user");
			User user=(User) session.getAttribute("user");
			
			out.println("最后一次访问时间："+session.getLastAccessedTime());
			out.println("是否是新的session："+session.isNew());
			if(user!=null) {
				out.println("登陆成功：</br>");	
			}else {
				out.println("登录失败");
			}
			 
			out.println("<table width='90%' border='1'>");
			
			out.println("<tr>");
			out.println("<td>序号</td>");
			out.println("<td>书号</td>");
			out.println("<td>书名</td>");
			out.println("<td>价格</td>");
			out.println("<td>操作</td>");
		
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
				out.println("<td><a href='delete?isbn="+list.get(i).getIsbn()+"'>删除 |<a href='edit.do?isbn="+list.get(i).getIsbn()
						+"'>编辑</td>");
				
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<a href='addBook.html'> 添加图书");
			out.println("</body>");
			out.println("</html>");
			
			out.close();
	}

}
