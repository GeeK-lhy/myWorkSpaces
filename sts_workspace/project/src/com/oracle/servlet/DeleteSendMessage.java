package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;

/**
 * Servlet implementation class DeleteSendMessage
 */
@WebServlet("/files/deleteSendMessage.do")
public class DeleteSendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("123");
		MessageService ms=new MessageService();
		String []sendId=request.getParameterValues("sendId");
		int[]ids=new int[sendId.length];
		System.out.println(sendId.length);
		for(int i=0;i<ids.length;i++) {
			ids[i]=Integer.valueOf(sendId[i]);
		}
		ms.deleteSendMessage(ids);
		response.sendRedirect("getSendMessage.do");
		//request.getRequestDispatcher("getSendMessage.do").forward(request, response);
	}

}
