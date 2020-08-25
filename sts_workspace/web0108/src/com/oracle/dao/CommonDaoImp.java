package com.oracle.dao;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.List;

import com.oracle.jdbcutil.JdbcUtil;
import com.oracle.vo.Book;
import com.oracle.vo.Table;

public class CommonDaoImp {

	
//	public List<Book> query(Class c){
	public <T> List<T> query(Class<T> c) {
		List<T> list=new ArrayList<T>();
		StringBuffer sql=new StringBuffer("select * from ");
//		StringBuffer sql=new StringBuffer("select * from ");
		Table table=(Table)c.getAnnotation(Table.class);
		String name=table.value();
		if(table!=null) {
			sql.append(name);
		}
		else {
			sql.append(c.getSimpleName());
		}
//		List<Book>list=new ArrayList<Book>();
		try(Connection conn=JdbcUtil.getConnection();
			PreparedStatement ps=conn.prepareStatement(sql.toString());
				ResultSet rs=ps.executeQuery();){
//			while(rs.next()) {
//				Book book=new Book();
//				book.setIsbn(rs.getInt(1));
//				book.setBookName(rs.getString(2));
//				book.setPrice(rs.getInt(3));
//				list.add(book);
//			}
			Field []fs=c.getDeclaredFields();
			while(rs.next()) {
				T t=c.newInstance();
				for(Field f:fs) {
					f.setAccessible(true);
					if(f.getType()==Integer.class) {
						f.set(t,rs.getInt(f.getName()));
					}
					else if(f.getType()==String.class) {
						f.set(t,rs.getString(f.getName()));
					}
					else {
						f.set(t, rs.getObject(f.getName()));
					}
				}
				list.add(t);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		
		return list;
	}

	
	public void insert(Object obj) {
		Class c=obj.getClass();
	 	String table_name=c.getSimpleName();
	 	Table t=(Table) c.getAnnotation(Table.class);
	 	if(t!=null) {
	 		 table_name=t.value();
	 	}
	 	StringBuffer sql=new StringBuffer("insert into "+table_name+ " values(null,?,?)");
	 	try(Connection conn=JdbcUtil.getConnection();
	 		PreparedStatement ps=conn.prepareStatement(sql.toString())){
	 		Field []fs=c.getDeclaredFields();
	 		for(int i=1;i<fs.length;i++) {
	 			fs[i].setAccessible(true);
	 			ps.setObject(i,fs[i].get(obj));
//	 			ps.setString(1, b.getBookName());
//	 			ps.setInt(2,b.getPrice());
	 		}
	 		ps.execute();
	 		
	 	}catch(Exception e) {
	 		
	 	}
		
	}
	public <T>void delete(String str) {
//		String table_name=c.getSimpleName();
//		Table t=c.getAnnotation(Table.class);
//		if(t!=null) {
//			table_name=t.value();
//		}
		StringBuffer sql=new StringBuffer("delete from books where bookName=?");
		
		try(Connection conn=JdbcUtil.getConnection();
			PreparedStatement ps=conn.prepareStatement(sql.toString())){
			ps.setString(1, str);
			ps.execute();
		}catch(Exception e) {
			
		}
	}

}
