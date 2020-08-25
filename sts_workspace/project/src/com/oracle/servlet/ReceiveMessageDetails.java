package com.oracle.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;
import com.oracle.vo.Emp;

/**
 * Servlet implementation class ReceiveMessageDetails
 */
@WebServlet("/files/receiveMessageDetails.do")
public class ReceiveMessageDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receiveId=request.getParameter("receiveId");
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		MessageService ms=new MessageService();
		ms.updateDate(Integer.valueOf(receiveId));
		Map<String,Object>map=ms.getReceiveMessageById(emp.getEmpId(), Integer.valueOf(receiveId));
		request.setAttribute("rmap", map);
		request.getRequestDispatcher("receiveMessageDetails.jsp").forward(request, response);;
//	
	}

}
