package com.oracle.service;

import java.util.ArrayList;
import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.ReceiveMessageDao;
import com.oracle.dao.SendMessageDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.ReceiveMessage;
import com.oracle.vo.SendMessage;

/**
 * 
 * @author lhy
 * created Date :
 *
 */
public class MessageService {
	
	public void sendMessage(SendMessage message,Integer []emps) {			
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao sdao=session.getMapper(SendMessageDao.class);
			ReceiveMessageDao rdao=session.getMapper(ReceiveMessageDao.class);
			sdao.insert(message);
			for(Integer id:emps) {
				ReceiveMessage rm=new ReceiveMessage();
				rm.setSendId(message.getSendId());
				rm.setEmpId(id);	
				rdao.insert(rm);
			}
			session.commit();
		}	
	}
	//获得已经发送的消息
	public List<SendMessage> getSendMessage(Integer empId){
		List<SendMessage> list =new ArrayList<SendMessage>();
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao dao=session.getMapper(SendMessageDao.class);
			list=dao.getSendMessage(empId);
		}
		return list;
	}
	public List<Map<String,Object>> getReceiveMessage(Integer empId){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			list=dao.getReceiveMessage(empId);
		}
		return list;
	}
}	
