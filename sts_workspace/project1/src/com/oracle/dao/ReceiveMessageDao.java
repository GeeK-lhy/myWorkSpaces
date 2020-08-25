package com.oracle.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.ReceiveMessage;

public interface ReceiveMessageDao {
	public void insert(ReceiveMessage message);
	public List<Map<String,Object>> getReceiveMessage(@Param("empId")Integer empId);
	public void delete(@Param("receiveId")Integer revceiveId);
}
