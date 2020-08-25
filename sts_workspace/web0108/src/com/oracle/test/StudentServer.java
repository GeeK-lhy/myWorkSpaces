package com.oracle.test;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

/**
 * Servlet implementation class StudentServer
 */
@WebServlet("/student.do")
public class StudentServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("userName");
		String age=request.getParameter("age");
		String degree=request.getParameter("degree");
		String []hobby=request.getParameterValues("hobby");
		System.out.println("name:"+name);
		System.out.println("age"+age);
		System.out.println("degree"+degree);
		System.out.println("hobby:"+Arrays.toString(hobby));
	
		Enumeration<String> enu=request.getParameterNames();
		while(enu.hasMoreElements()) {
			String parm=enu.nextElement();
			System.out.println(parm+":"+Arrays.toString(request.getParameterValues(parm)));
		}
		System.out.println("“‘œ¬ «Map");
		Map<String,String[]> map=request.getParameterMap();
		for(Entry<String,String[]> e:map.entrySet()) {
			System.out.println(e.getKey()+":"+Arrays.toString(e.getValue()));
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
