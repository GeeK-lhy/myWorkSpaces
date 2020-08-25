package com.oracle.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.ReceiveMessage;

public interface ReceiveMessageDao {
	public void insert(ReceiveMessage message);
	public List<Object> getReceiveMessage(Map<String,Object> map);
	public void delete (int []receiveId);
	public Map<String,Object> getReceiveMessageById(@Param("empId") Integer receiveId,@Param("receiveId") Integer id);
	public void updateDate(Integer id);
	public int getReceiveMessageRecordCount(Map<String,Object> map);

}
