package com.oracle.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.oracle.dao.MyUserDao;

@Service
public class MyUserService {
	@Autowired
	MyUserDao dao;
	public	List<Map<String,Object>> selectLeder(String unit,String roleid){
	return dao.selectLeader(unit, roleid);
	}
	public String selectRoleId(String userid) {
		
		return dao.selectRoleId(userid);
	}
}
