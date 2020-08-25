package com.oracle.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.vo.Book;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/bookList.do")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> list=new ArrayList<String>();
		list.add("LHY");
		list.add("wyj");
		list.add("wpp");
		request.setAttribute("stringList", list);
		Book b=new Book(2,"java",40);
		request.setAttribute("book",b );
		
		request.setAttribute("array",new String[] {"哈尔滨","吉林","辽宁","山东"});
		List<Book> set=new ArrayList();
		set.add(new Book(1,"傲慢与偏见",50));
		set.add(new Book(5,"战争与和平",60));
		set.add(new Book(519,"浪潮之巅",80));
		set.add(new Book(233,"自卑与超越",65));
		set.add(new Book(223,"数学之美",45));
		set.add(new Book(19,"java",50));
		request.setAttribute("set",set);
		request.setAttribute("date", new Date());
		Map<Integer,Book>map=new HashMap<Integer,Book>();
		for(int i=0;i<6;i++) {
			map.put(i,set.get(i));
		}
		request.setAttribute("map", map);
		//页面转发
		//分发器
		RequestDispatcher rd=request.getRequestDispatcher("viewList.jsp");
		rd.forward(request, response);
	
	}

}
