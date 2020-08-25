package com.oracle.service;
import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.StudentDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Student;
public class StudentService {
		public List<Student> getStudents(Map<String,Object> map){
			List<Student> list=new ArrayList<Student>();
			try(SqlSession session=MyBatisUtil.getSession()){
				StudentDao dao=session.getMapper(StudentDao.class);
				list=dao.getAll(map);
				System.out.println(list.size());
			}
			return list;
		}
		public void deleteStudents(int []ids ) {
			try(SqlSession session=MyBatisUtil.getSession()){
				StudentDao dao=session.getMapper(StudentDao.class);
				dao.delete(ids);
				session.commit();
			}
		}
}
