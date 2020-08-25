package com.oracle.servlet;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.service.StudentService;
import com.oracle.vo.Student;

/**
 * Servlet implementation class StudentListServlet
 */
@WebServlet("/studentList.do")
public class StudentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		StudentService service=new StudentService();
		String studentName=request.getParameter("studentName");
		String degree=request.getParameter("degree");
		String city=request.getParameter("city");
		String classId=request.getParameter("classId");
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("studentName", studentName);
		map.put("degree", degree);
		map.put("city", city);
		
		if(classId==null) {
		classId="0";
		}
		map.put("classId",Integer.valueOf(classId));
		request.setAttribute("classId", classId);
		List<Student> list=service.getStudents(map);
		request.setAttribute("list", list);
		request.setAttribute("studentName", studentName);
		request.setAttribute("city", city);

		request.getRequestDispatcher("studentList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
