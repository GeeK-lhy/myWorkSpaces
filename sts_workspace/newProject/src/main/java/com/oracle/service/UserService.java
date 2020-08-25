package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.UserDao;
import com.oracle.vo.User;

@Service
public class UserService {
	@Autowired
	UserDao dao;
	public void saveUser(User user) {
		dao.saveUser(user);
	}
}
