package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.vo.User;

/**
 * Servlet implementation class PayServlet
 */
@WebServlet("/pay.do")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(user!=null) {
			int sum=0;
			Map<Integer,List<Object>> map=(Map<Integer,List<Object>>) session.getAttribute("goods");
			Collection<List<Object>>c=map.values();
			for(List<Object> list:c) {
				int p=(int) list.get(1);
				int n=(int)list.get(2);
				sum+=p*n;
			}
			response.setContentType("Text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<html>");
			out.println("<head><title></title>");
			out.print("<script>alert('总价格为：'+"+sum+");</script>");
			out.println("</head>");
			out.println("<body>");
			out.println("</body>");
			out.println("</html>");
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
