package com.oracle.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.TclassDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.Tclass;

public class TclassService {
	
	public List<Tclass> getClassDetail(){
		List<Tclass> list=new ArrayList<Tclass>();
			try(SqlSession session=MyBatisUtil.getSession()){
				TclassDao dao=session.getMapper(TclassDao.class);
				list=dao.getClassDetail();
				
				session.commit();
			}
			return list;
	}
		
	
}
