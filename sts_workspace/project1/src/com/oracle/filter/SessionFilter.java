package com.oracle.filter;
import java.util.*;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.vo.Emp;

/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter("/*")
public class SessionFilter implements Filter {

		List<String> list=new ArrayList<String>();
    /**
     * Default constructor. 
     */
    public SessionFilter() {
       
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		String path=req.getServletPath();
		if(list.contains(path)||(!path.contains(".html")&&!path.contains(".jsp")&&!path.contains(".do"))) {
		chain.doFilter(request, response);
		}else {
			HttpSession session=req.getSession();
			Emp emp=(Emp) session.getAttribute("Emp");
			if(emp!=null) {
				chain.doFilter(request, response);
			}else {
				HttpServletResponse res=(HttpServletResponse)response;
				String context=req.getContextPath();
				res.sendRedirect(context+"/login.html");
			}
		}
		//chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		list.add("/login.html");
		list.add("/login.do");
	}

}
