package com.oracle.test;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HeaderServelet
 */
@WebServlet("*.header")
public class HeaderServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得所有的消息头
		Enumeration<String> headers=request.getHeaderNames();
		while(headers.hasMoreElements()) {
			String str=headers.nextElement();
			System.out.println(str+":"+request.getHeader(str));
		}
		int length=request.getIntHeader("Content-Length");
		System.out.println(length);
		System.out.println("------------------------------");
		System.out.println(request.getMethod());
		System.out.println(request.getRequestURI());
		System.out.println(request.getProtocol());
		System.out.println(request.getRequestURL());
		System.out.println(request.getServletPath());
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getContextPath());
		System.out.println(request.getQueryString());
		System.out.println("------------------------------");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
