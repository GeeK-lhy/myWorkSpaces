package com.oracle.dao;

import java.util.List;

public interface CommonDao {
	public <T> List<T> query(Class<T> clazz);
	public void insert(Object objec);

}
