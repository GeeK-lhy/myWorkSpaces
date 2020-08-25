package com.oracle.sessionInfo;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.oracle.vo.Operator;

public class SessionInfo {
	public static ConcurrentHashMap<Object,HttpSession> sessionMap=new ConcurrentHashMap<>();

	public static ConcurrentHashMap<Object, HttpSession> getSessionMap() {
		return sessionMap;
	}

	public static void setSessionMap(ConcurrentHashMap<Object, HttpSession> sessionMap) {
		SessionInfo.sessionMap = sessionMap;
	}




	
}
