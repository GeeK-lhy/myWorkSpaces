package com.oracle.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.CodeService;

/**
 * Servlet implementation class CodeServlet
 */
@WebServlet("/code.do")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code= request.getParameter("code");
		String value=CodeService.getCode(code);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(value);
	}

}
