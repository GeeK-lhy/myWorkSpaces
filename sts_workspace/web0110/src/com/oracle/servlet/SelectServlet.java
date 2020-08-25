package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
					System.out.println("cookie������û���"+userName);
				
				}else if(c.getName().equals("password")) {
					password=c.getValue();
					System.out.println("cookie���������"+password);
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
			out.println("<head><title>��½�ɹ�</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<div style='float:right'><a href='logout.do'>ע��</a> </div>");
			out.println("session ����ʱ��:" +session.getCreationTime()+"</br>");
			out.println("session ��id:"+session.getId()+"</br>");
			 out.println("��½����:"+request.getServletContext().getAttribute("count"));
			out.println("session���ʱ����:"+session.getMaxInactiveInterval()+"</br>");
		//	session.removeAttribute("user");
			
			out.println("���һ�η���ʱ�䣺"+session.getLastAccessedTime());
			out.println("�Ƿ����µ�session��"+session.isNew());
//			if(user!=null) {
				out.println("��½�ɹ���</br>");	
//			}else {
//				out.println("��¼ʧ��");
//			}
//			 
			out.println("<table width='90%' border='1'>");
			
			out.println("<tr>");
			out.println("<td>���</td>");
			out.println("<td>���</td>");
			out.println("<td>����</td>");
			out.println("<td>�۸�</td>");
			out.println("<td>����</td>");
		
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
				out.println("<td><a href='delete?isbn="+list.get(i).getIsbn()+"'>ɾ�� |<a href='edit.do?isbn="+list.get(i).getIsbn()
						+"'>�༭</td>");
				
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<a href='addBook.html'> ���ͼ��");
			out.println("</body>");
			out.println("</html>");			
			out.close();
		}
	}

}
