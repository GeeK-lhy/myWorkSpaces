package com.oracle.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.SendMessage;

public interface SendMessageDao {
	public void insert(SendMessage message);
	public List<Object> getSendMessage(Map<String,Object> map);
	public void delete(int []ids);
	public SendMessage getSendMessageById(@Param("empId") Integer empId,@Param("Id") Integer sendId);
	public int getSendMessageRecordCount(Map<String,Object>map);
}
