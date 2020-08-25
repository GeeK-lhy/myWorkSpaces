package com.oracle.test;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.StudentDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Student;

import java.util.*;
public class Test2 {

	public static void main(String[] args) {
		try(SqlSession session=MyBatisUtil.getSession()){
			StudentDao dao=session.getMapper(StudentDao.class);
			List<Student> list=dao.getAll();
			for(Student s:list) {
				System.out.println(s);
			}
		}
	}

}
