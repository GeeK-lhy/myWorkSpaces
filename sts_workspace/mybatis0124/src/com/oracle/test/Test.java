package com.oracle.test;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.StudentDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Student;

public class Test {

	public static void main(String[] args) {
		try(SqlSession session=MyBatisUtil.getSession()){
			StudentDao dao=session.getMapper(StudentDao.class);
//			List<Student> l=dao.fuzzyQuery("k");
//			System.out.println(dao.getCount());
//			List<Student> l=dao.getAll();
//			for(Student s:l)
//				System.out.println(s);
//			Map<String,Object> map=new HashMap<String,Object>();
//			map=dao.getAvgCount();
//			System.out.println(map);
//			
//			List<Map<String,Object>> list=dao.getDegree();
//			for(Map<String,Object> m:list) {
//				System.out.println(m);
//			}
//			Map<String,Integer> m=new HashMap<String,Integer>();
//			m.put("start", 3);
//			m.put("size", 3);
//			List<Student> list2=dao.getByPage(m);
//			List<Student> list2=dao.getPages(3,4);
//			for(Student s:list2) {
//				System.out.println(s);
//			}
//			
//			List<Map<String,Object>> list3=dao.getDetials();
//			for(Map<String,Object> m:list3)
//				System.out.println(m);
//			List<Student> list3=dao.fuzzyQuery("k");
//			for(Student s:list3) {
//				System.out.println(s);
//			}
//			List<Student>list4=dao.orderBy("salary");
//			for(Student s:list4) {
//				System.out.println(s);
//			}
//				
		}

	}

}
