package com.oracle.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.dao.BookDao;
import com.oracle.vo.Book;
import com.oracle.vo.Goods;
import com.oracle.vo.ShoppingCart;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		BookDao dao=new BookDao();
		String isbn=request.getParameter("isbn");
		Book b=dao.getBookById(Integer.valueOf(isbn));	
		//Goods g=new Goods(b,1);
		ShoppingCart cart=(ShoppingCart) session.getAttribute("cart");
		if(cart.getMap().containsKey(Integer.valueOf(isbn))) {
			Map m=cart.getMap();
			Goods g=(Goods) m.get(Integer.valueOf(isbn));
			g.setNum(g.getNum()+1);
			m.put(Integer.valueOf(isbn),g);
			//cart.setMap(m);
			session.setAttribute("cart",cart);
		}
		else {
			Goods g=new Goods(b,1);
		cart.addGoods(b.getIsbn(),g);
		session.setAttribute("cart",cart);
		}
	//	response.sendRedirect("bookList.do");
	}

}
