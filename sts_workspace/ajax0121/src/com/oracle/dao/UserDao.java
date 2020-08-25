package com.oracle.dao;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.User;

public class UserDao {
	public User gatAll(String userName,String password) {
		return Dao.queryOne("select * from user where username=? and password=?",User.class,userName,password);
	}
	public void userLogin(Integer id) {
		Dao.executeSql("update user set loginCount=loginCount+1,lastdate=now() where userid=?", id);
	}
	public User getUserByName(String userName) {
		return Dao.queryOne("select * from user where username=?", User.class,userName);
	}
}
