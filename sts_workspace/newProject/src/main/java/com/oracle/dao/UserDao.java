package com.oracle.dao;

import org.springframework.stereotype.Repository;

import com.oracle.vo.User;

@Repository
public interface UserDao {
	public void saveUser(User user);
}
