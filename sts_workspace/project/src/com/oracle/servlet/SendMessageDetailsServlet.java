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
import com.oracle.vo.SendMessage;

/**
 * Servlet implementation class SendMessageDetailsServlet
 */
@WebServlet("/files/sendMessageDetails.do")
public class SendMessageDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendId=request.getParameter("sendId");
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		MessageService ms=new MessageService();
		SendMessage sm=ms.getSendMessageById(emp.getEmpId(),Integer.valueOf(sendId));
		request.setAttribute("sm",sm);
		request.getRequestDispatcher("sendMessageDetails.jsp").forward(request, response);;
	}

}
