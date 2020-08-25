package com.oracle.dao;

import java.util.HashMap;
import java.util.Map;

public class UserService {
	 static Map<String,String> map=new HashMap<String,String>();
	 static {
		 map.put("james", "tiger");
		 map.put("scott", "tiger");
		 map.put("sky","tiger");
		 map.put("admin", "root");
	 }
	 public boolean login(String userName,String password) {
		 if(map.containsKey(userName)&&map.get(userName).equals(password)) {
			 return true;
		 }else {
			 return false;
		 }
	 }
	 
}
