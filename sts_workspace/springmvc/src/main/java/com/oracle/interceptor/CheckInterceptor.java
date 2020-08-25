package com.oracle.interceptor;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
public class CheckInterceptor implements HandlerInterceptor{
		int start;
		int end;
		
		public int getStart() {
			return start;
		}

		public void setStart(int start) {
			this.start = start;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}

			@Override
			public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
					throws Exception {
				System.out.println(request.getRequestURL()+"¾­¹ýÁËÀ¹½ØÆ÷");
				Calendar c = Calendar.getInstance();
				int hour=c.get(Calendar.HOUR_OF_DAY);
				if(hour<start || hour>end) {
					response.sendRedirect("http://www.163.com");
					return false;
				}
				return true;
			}
}
