package com.example.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.dao.UserDao;
import com.example.springboot.vo.User;

@Service
public class UserService {

	@Autowired
	UserDao dao;
	
	public User geyById(int id) {
		return dao.getById(id);
	}
}
