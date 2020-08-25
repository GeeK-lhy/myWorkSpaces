package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

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
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Cookie []cs=request.getCookies();
		String userName=null;
		String password=null;
		if(cs!=null) {
			for(Cookie  c:cs) {

				if(c.getName().equals("userName")) {
					userName=c.getValue();
					System.out.println("cookie保存的用户名"+userName);
				
				}else if(c.getName().equals("password")) {
					password=c.getValue();
					System.out.println("cookie保存的密码"+password);
				}
			}
		}
			if(userName!=null&&password!=null) {
				UserDao ud=new UserDao();
				user=ud.gatAll(userName, password);
			}
		if(user==null) {
				response.sendRedirect("login.html");
		}else {
			BookDao bd=new BookDao();
			List<Book> list=bd.getAll();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();

			out.println("<html>");
			out.println("<head><title>登陆成功</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<div style='float:right'><a href='logout.do'>注销</a> </div>");
			out.println("登陆成功：</br>");	
			out.println("登录时间:" +new Timestamp(session.getCreationTime())+"</br>");
			out.println("欢迎："+user.getRealName()+"</br>");	

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
				out.println("<td><a href='add.do?isbn="+list.get(i).getIsbn()+"'>添加到购物车 </td>");
				
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<a href='show.do'> 查看购物车");
			out.println("</body>");
			out.println("</html>");			
			out.close();
		}
	}

}
