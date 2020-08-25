package com.oracle.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class MyServletContextLisener
 *
 */
@WebListener
public class MyServletContextLisener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public MyServletContextLisener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    	  System.out.println("服务器已关闭：工程布置在："+sce.getServletContext().getRealPath("/"));
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
       System.out.println("服务器已经完成初始化工作：工程布置在："+sce.getServletContext().getRealPath("/"));
       sce.getServletContext().setAttribute("count", 0);
       sce.getServletContext().setAttribute("loginMap", MySessionAttributeListener.map);
    }
	
}
