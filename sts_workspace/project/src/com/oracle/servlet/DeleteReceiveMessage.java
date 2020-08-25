package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.MessageService;

/**
 * Servlet implementation class DeleteReceiveMessage
 */
@WebServlet("/files/deleteReceiveMessage.do")
public class DeleteReceiveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageService ms=new MessageService();
		String []receiveId=request.getParameterValues("receiveId");
		int[]ids=new int[receiveId.length];
		for(int i=0;i<ids.length;i++) {
			ids[i]=Integer.valueOf(receiveId[i]);
		}
		ms.deleteReceiveMessage(ids);
		response.sendRedirect("receiveMessageList.do");
	}

}
