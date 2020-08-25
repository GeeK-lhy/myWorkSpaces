package com.oracle.listener;

import java.util.Date;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class MySessionLifeListener
 *
 */
@WebListener
public class MySessionLifeListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public MySessionLifeListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
    	HttpSession session=se.getSession();
    	System.out.println("session�Ѵ���,session id:"+session.getId());
    	System.out.println(" ����ʱ��:"+new Date(session.getCreationTime()));
    	int count=(int)session.getServletContext().getAttribute("count");
    	session.getServletContext().setAttribute("count", count+1);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	HttpSession session=se.getSession();
    	int count=(int)session.getServletContext().getAttribute("count");
         System.out.println("session�Ѿ�����");
         System.out.println("id�ǣ�"+se.getSession().getId()+":"+new Date());
      	session.getServletContext().setAttribute("count", count-1);
    }
	
}
