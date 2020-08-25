package com.oracle.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.oracle.dao.ReceiveMessageDao;
import com.oracle.dao.SendMessageDao;
import com.oracle.util.MyBatisUtil;
import com.oracle.vo.ReceiveMessage;
import com.oracle.vo.SendMessage;

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
	public List<Object> getSendMessage(Map<String,Object>map){
		List<Object> list =new ArrayList<Object>();
		List<Object> list2 =new ArrayList<Object>();
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao dao=session.getMapper(SendMessageDao.class);
			list=dao.getSendMessage(map);
			for(int i=(int) map.get("start");i<(int)map.get("start")+(int)map.get("pageSize");i++) {
				list2.add(list.get(i));
			}
		}
		return list2;
	}
	public List<Object> getReceiveMessage(Map<String,Object> map){
		List<Object> list=new ArrayList<Object>();
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			list=dao.getReceiveMessage(map);
		}
		return list;
	}
	public void deleteSendMessage(int []ids) {
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao dao=session.getMapper(SendMessageDao.class);
			dao.delete(ids);
			session.commit();
		}
	}
	public void deleteReceiveMessage(int[] ids) {
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			dao.delete(ids);
			session.commit();
		}
	}
	public SendMessage getSendMessageById(Integer empId ,Integer sendId) {
		SendMessage sm=null;
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao dao=session.getMapper(SendMessageDao.class);
			sm=dao.getSendMessageById(empId,sendId);
		}
		return sm;
	}
	public Map<String,Object> getReceiveMessageById(Integer empId,Integer receiveId){
		Map<String,Object>map=null;
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			map=dao.getReceiveMessageById(empId,receiveId);
		}
		return map;
	}
	public void updateDate(Integer id) {
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			dao.updateDate(id);
			session.commit();
		}
	}
	public int getSendMessageRecordCount(Map<String,Object>map) {
		int n=0;
		try(SqlSession session=MyBatisUtil.getSession()){
			SendMessageDao dao=session.getMapper(SendMessageDao.class);
			 n=dao.getSendMessageRecordCount(map);
		}
		return n;
	}
	public int getReceiveMessageRecordCount(Map<String,Object> map) {
		int n=0;
		try(SqlSession session=MyBatisUtil.getSession()){
			ReceiveMessageDao dao=session.getMapper(ReceiveMessageDao.class);
			n=dao.getReceiveMessageRecordCount(map);
		}
		return n;
	}	
}
