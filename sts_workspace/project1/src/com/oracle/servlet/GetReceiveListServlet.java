package com.oracle.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;
import com.oracle.vo.Emp;

/**
 * Servlet implementation class GetReceiveListServlet
 */
@WebServlet("/files/receiveMessageList.do")
public class GetReceiveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		MessageService ms=new MessageService();
		List<Map<String,Object>>list=ms.getReceiveMessage(emp.getEmpId());
		System.out.println(list.size() );
		request.setAttribute("list", list);
		request.getRequestDispatcher("receiveMessageList.jsp").forward(request, response);
	}

}
