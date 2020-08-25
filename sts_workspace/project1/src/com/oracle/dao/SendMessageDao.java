package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.SendMessage;

public interface SendMessageDao {

		public void insert(SendMessage message);
		public List<SendMessage> getSendMessage(@Param("empId") Integer empId);
}
