package com.oracle.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.StudentDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Student;

public class Test2 {

	public static void main(String[] args) {
		
		SqlSession session=MyBatisUtil.getSession();
		StudentDao dao=session.getMapper(StudentDao.class);
		List<Student> list=dao.get();
		for(Student s:list) {
		System.err.println(s);
		}
		session.close();
		
		SqlSession session1=MyBatisUtil.getSession();
		StudentDao dao1=session1.getMapper(StudentDao.class);
		List<Student> list1=dao1.get();
		for(Student s:list1) {
		System.err.println(s);
		}
		session1.close();
	}

}
