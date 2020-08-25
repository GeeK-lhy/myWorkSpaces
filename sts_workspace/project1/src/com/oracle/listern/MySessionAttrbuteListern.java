package com.oracle.listern;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.oracle.vo.Emp;

/**
 * Application Lifecycle Listener implementation class MySessionAttrbuteListern
 *
 */
@WebListener
public class MySessionAttrbuteListern implements HttpSessionAttributeListener {

	static ConcurrentMap<String,HttpSession>map=new ConcurrentHashMap<String,HttpSession>();
    /**
     * Default constructor. 
     */
    public MySessionAttrbuteListern() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
       if(se.getName().contains("Emp")) {
    	   Emp emp=(Emp) se.getSession().getAttribute("Emp");
    	   if(map.containsKey(emp.getEmpNo())) {
    		  map.remove(emp.getEmpNo()).invalidate();
    	   }
    	   map.put(emp.getEmpNo(),se.getSession());
       }
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	if(se.getName().equals("Emp")) {
    		Emp emp=(Emp)se.getValue();
    		map.remove(emp.getEmpNo());
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
