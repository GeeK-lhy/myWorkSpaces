package com.oracle.listener;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.oracle.vo.User;

/**
 * Application Lifecycle Listener implementation class MySessionAttributeListener
 *
 */
@WebListener
public class MySessionAttributeListener implements HttpSessionAttributeListener {

	static ConcurrentHashMap<String,HttpSession> map=new ConcurrentHashMap<String,HttpSession>();
    /**
     * Default constructor. 
     */
    public MySessionAttributeListener() {
        
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	System.out.println("�����һ�����ԣ�"+se.getName()+"  ֵ�ǣ�"+se.getValue());
    	System.out.println(se.getSession().getId());
    	if(se.getName().equals("user")) {
    		HttpSession session=se.getSession();
    		User user=(User)se.getValue();
    		if(map.containsKey(user.getUserName()) ){
    			map.remove(user.getUserName()).invalidate();
    		}
    		map.put(user.getUserName(),session);
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	System.out.println("�Ƴ���һ������:"+se.getName()+"ֵ�ǣ�"+se.getValue());
    	System.out.println(se.getSession().getId());
    	if(se.getName().equals("user")) {
    		User user=(User)se.getValue();
    		map.remove(user.getUserName());
    	}
    
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
       System.out.println("�滻��ֵ��������"+se.getName()+"ԭ����ֵ�ǣ�"+se.getValue());
       System.out.println("�滻�������ֵΪ��"+se.getSession().getAttribute(se.getName()));
       if(se.getName().equals("user")) {
    	   User user=(User)se.getSession().getAttribute("user");
    	   if(map.containsKey(user.getUserName())) {
    		   map.remove(user.getUserName()).invalidate();
    	   }else {
    		   map.remove(((User)se.getValue()).getUserName());
    	   }
    	   map.put(user.getUserName(),se.getSession());
       } 
    }
	
}
