package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.UserMapper;
import com.oracle.vo.User;

@Service
public class UserService {
	@Autowired
	UserMapper dao;
	
	@Transactional(readOnly=true)
	public User login(String account_name) {
			return  dao.selectByAccountName(account_name);
	}
	public User selectByPrimaryKey(String account_name) {
		return  dao.selectByAccountName(account_name);
	}
	public User selectByAccountName(String account_name) {
		return dao.selectByAccountName(account_name);
	}
	public void addUser(User user) {
		dao.addUser(user);
	}
	
	public List<User> selectAllUser(){
		return dao.selectAllUser();
	}
	public void addPower(String account_name) {
		dao.addPower(account_name);
	}
	
	public void deletePower(String account_name) {
		dao.deletePower(account_name);
	}
}
