package com.oracle.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.oracle.sessionInfo.SessionInfo;
import com.oracle.vo.Operator;


public class CheckInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
    		throws Exception {
   
    		Operator o=(Operator) request.getSession().getAttribute("operator");
    		if(o!=null) {
    			if(SessionInfo.getSessionMap().get(o.getId()).getId().equals(request.getSession().getId()))
    			return true;
    			else {
    				response.sendRedirect(request.getContextPath()+"/login.jsp");
    				return false;
    			}
    		}
    		else {
    			response.sendRedirect(request.getContextPath()+"/login.jsp");
    			return false;
    		}
    }
}
