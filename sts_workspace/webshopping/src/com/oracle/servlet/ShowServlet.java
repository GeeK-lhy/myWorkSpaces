package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.vo.User;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/show.do")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user!=null) {
			Map<Integer,List<Object>> map=(Map<Integer,List<Object>>) session.getAttribute("goods");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<html>");
			out.println("<head><title></title>");
			out.println("</head>");
			out.println("<body>");
			
			out.println("<table width='90%' border='1'>");
			
			out.println("<tr>");
			out.println("<td>书号</td>");
			out.println("<td>书名</td>");
			out.println("<td>价格</td>");
			out.println("<td>数量</td>");
			out.println("<td>操作</td>");
			out.println("</tr>");
			Set<Entry<Integer,List<Object>>> sets=map.entrySet();
			for(Entry<Integer,List<Object>> e:sets) {
				List<Object>list=e.getValue();
				out.println("<tr>");
				out.println("<td>"+e.getKey()+"</td>");
				out.println("<td>"+list.get(0)+"</td>");
				out.println("<td>"+list.get(1)+"</td>");
				out.println("<td>"+list.get(2)+"</td>");
				out.println("<td><a href='addCount.do?isbn="+e.getKey()+"'>增加|</a><a href='reduce.do?isbn="+e.getKey()+"'>减少|</a><a href='delete.do?isbn="+e.getKey()+"'>删除商品</a></td>");
				out.println("</tr>");
			}
			out.println("<tr>");
			out.println("<td colspan='5' align='right'><a href='pay.do'>结算</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("<a href='select.do'>返回商品页</a> ");
			out.println("</body>");
			out.println("</html>");	
		}
		else {
			response.sendRedirect("login.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest resquest, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(resquest, response);
	}

}
