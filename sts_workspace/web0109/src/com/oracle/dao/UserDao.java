package com.oracle.dao;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.User;

public class UserDao {
	public User gatAll(String userName,String password) {
		return Dao.queryOne("select * from user where username=? and password=?",User.class,userName,password);
	}
}
