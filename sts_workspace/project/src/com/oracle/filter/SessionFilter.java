package com.oracle.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.service.EmpService;
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		String path=req.getServletPath();
		//System.out.println(path);
		if(list.contains(path)||(!path.contains(".html")&&!path.contains(".jsp")&&!path.contains(".do"))) {

			chain.doFilter(request, response);
		}else {
			
			HttpSession session=req.getSession();
			Emp emp=(Emp) session.getAttribute("Emp");

				Cookie []cs=req.getCookies();
				
				String empNo=null;
				String password=null;
				if(cs!=null) {
					//System.out.println(cs.length);
					for(Cookie c:cs) {
						if(c.getName().equals("empNo"))
							empNo=c.getValue();
						else if(c.getName().equals("password")) 
							password=c.getValue();
					}
				}else
					System.out.println("null");
				if(empNo!=null&&password!=null) {
				EmpService service=new EmpService();
					emp=service.login(empNo, password);
					//System.out.println(emp);
					req.getSession().setAttribute("Emp", emp);
				}
				
			if(emp!=null) {
				chain.doFilter(request, response);
			}else {
				HttpServletResponse res=(HttpServletResponse)response;
				String context=req.getContextPath();
				res.sendRedirect(context+"/login.html");
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		list.add("/login.html");
		list.add("/login.do");
	}

}
