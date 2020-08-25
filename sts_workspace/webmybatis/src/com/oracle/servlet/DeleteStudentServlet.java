package com.oracle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.StudentService;

/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/delete.do")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[]s=request.getParameterValues("studentId");
		int []ids=new int[s.length];
		for(int i=0;i<ids.length;i++) {
			ids[i]=Integer.valueOf(s[i]);	
		}
		StudentService service=new StudentService();
		service.deleteStudents(ids);
		response.sendRedirect("studentList.do");
	}

}
