package com.oracle.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.EmpDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Emp;

public class EmpService {
	public List<Emp> getAll(){
		List<Emp> list=null;
		try(SqlSession session=MyBatisUtil.getSession()){
			EmpDao dao=session.getMapper(EmpDao.class);
			list=dao.getAll();
		}
		return list;
	}
	public Emp login(String empNo,String password) {
		Emp emp=null;
		try(SqlSession session=MyBatisUtil.getSession()){
			EmpDao dao=session.getMapper(EmpDao.class);
			emp=dao.getEmpByPwd(empNo,password);
		}
		
		return emp;
		
	}
}
