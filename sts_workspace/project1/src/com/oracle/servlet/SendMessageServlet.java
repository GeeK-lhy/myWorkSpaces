package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;
import com.oracle.vo.Emp;
import com.oracle.vo.SendMessage;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/files/sendMessage.do")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//get all of parameters;
		request.setCharacterEncoding("UTF-8");
		String sendMessageTitle =request.getParameter("sendMessageTitle");
		String sendMessageContent =request.getParameter("sendMessageContent");
		String priority=request.getParameter("priority");
		String[] ids =request.getParameterValues("empId");
	//	String []ids=empId.split(",");
		Integer []id=new Integer[ids.length];
		for(int i=0;i<ids.length;i++) {
			id[i]=Integer.valueOf(ids[i]);
		}
		Emp emp=(Emp) request.getSession().getAttribute("Emp");
		SendMessage sm=new 	SendMessage();
		sm.setEmpId(emp.getEmpId());
		sm.setMessageContent(sendMessageContent);
		sm.setMessageTitle(sendMessageTitle);
		sm.setPriority(Integer.valueOf(priority));
		
		MessageService ms=new MessageService();
		ms.sendMessage(sm, id);
		
		response.sendRedirect("sendMessage.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
