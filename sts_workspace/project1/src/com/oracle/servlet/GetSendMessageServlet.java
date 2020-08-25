package com.oracle.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;
import com.oracle.vo.Emp;
import com.oracle.vo.SendMessage;

/**
 * Servlet implementation class GetSendMessageServlet
 */
@WebServlet("/files/getSendMessage.do")
public class GetSendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		MessageService ms=new MessageService();
		List<SendMessage> list=ms.getSendMessage(emp.getEmpId());
		request.setAttribute("list",list);	
		request.getRequestDispatcher("sendMessageList.jsp").forward(request,response);
	}

}
