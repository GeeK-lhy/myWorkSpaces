package com.oracle.aop3;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class JdbcInvocationHandler implements InvocationHandler {

	
		static {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
	@Override
	public Object invoke(Object arg0, Method method, Object[] arg2) throws Throwable {
		

		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/text","root","tiger");
		  Sql sql=method.getAnnotation(Sql.class);
		  conn.setAutoCommit(false);
			System.out.println("执行 的Sql如下：");
			System.out.println(sql.value());
		 PreparedStatement ps=conn.prepareStatement(sql.value());
		 try {
			 if(arg2!=null) {
			 for(int i=0;i<arg2.length;i++) {
				 ps.setObject(i+1, arg2[i]);
			 	}
			 }
			 ps.execute();
			 conn.commit();
		 }catch(Exception e) {
			 System.out.println("sql被回退 ");
			 conn.rollback();
		 }finally {
			 conn.close();
		 }
		 
		 return null;
	}

}
