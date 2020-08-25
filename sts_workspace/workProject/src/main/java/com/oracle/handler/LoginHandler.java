package com.oracle.handler;

import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.HttpServletBean;

import com.oracle.util.MD5Util;
import com.oracle.util.ReturnMessage;
import com.oracle.service.UserService;

import com.oracle.vo.User;

@Controller

public class LoginHandler {
	@Autowired
	UserService userService;

	@RequestMapping("/")
	public String defaultAction() {
	
		return "login";
	}
	  
	@RequestMapping("/{path}")
	public String jsPath(@PathVariable("path") String path) {
	return path;	
	}
	@RequestMapping("/renturnMessage")
	@ResponseBody
	public String returnMessage(String str) {
		return str;
	}

	@RequestMapping(value="/login",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String login(User user,Map<String,Object>map,HttpServletRequest request,HttpServletResponse response) {
	
		
		String message="请输入用户名和密码";
		if(user!=null && user.getAccount_name()!=null && user.getUser_password()!=null ) {
			String account_name=user.getAccount_name();
		User u1=userService.selectByAccountName(account_name);
		
		String passwd=user.getUser_password();

		if(u1!=null) {
			String user_password=MD5Util.formPassToDBPass(passwd,u1.getSalt());

			if(user_password.equals(u1.getUser_password())) {
				int role=u1.getRole();
				int jurisdiction =u1.getJurisdiction();
				
				HttpSession session=request.getSession();
				message="用户名密码正确";
				if(jurisdiction==1){
					session.setAttribute("userInfo", u1);
					map.put("userRole", u1.getRole());
					request.setAttribute("message", "用户名密码正确");
					 
					 }
				else {
					 request.setAttribute("message", "该用户没有权限访问");
						message= "该用户没有权限访问";
				}
			}
			
			else {
			 request.setAttribute("message", ReturnMessage.PASSWOED_ERROE);
			 message=  "密码错误";
			}
	    	}
		else {
			request.setAttribute("message", ReturnMessage.USER_NOT_EXIST);
			message=  "用户不存在";
		}
	}

		return message;
		
	}
	@RequestMapping("/returnMessage")
	@ResponseBody
	public String returnMessage(HttpServletRequest request,Map<String,Object> map) {
		map.put("returnMessage",request.getAttribute("message"));
		return "login";
	}
	@RequestMapping("/toRegister")
	public String toRegister() {
		
		
		return "register";
		
	}
	@RequestMapping("/register")
	public String register(HttpServletRequest request, HttpServletResponse response,User user) {
		
		if(user!=null && user.getAccount_name()!=null && user.getUser_password()!=null) {
			
			System.out.println(user.getUser_name());
			user.setJob_number(user.getAccount_name());
			String salt="1a2b3c4d";
			user.setUser_password(MD5Util.formPassToDBPass(user.getUser_password(), salt));
			user.setJurisdiction(0);
			user.setRole(0);
			user.setSalt(salt);
			userService.addUser(user);
		
		}
		return "login";
	}
	@RequestMapping("/toIndex")
	public String toIndex(Map<String,Object> map,HttpServletRequest request) {
		 String account_name=(String) request.getAttribute("account_name");
		 HttpSession session=request.getSession();
		 User user=(User) session.getAttribute("userInfo");
		 map.put("role",user.getRole());
		return "index";
	}
	
	@RequestMapping("/touserLimit")
	public String userLimit(Map<String,Object>map){
		List<User> list=userService.selectAllUser();
		System.out.println(list.size());
		if(list!=null) {
			map.put("userList", list);
		}
		return "userLimit";
	}
	@RequestMapping(value="addPower",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String addPower(HttpServletRequest request,String  account_name) {
		
		System.out.println( account_name);
		userService.addPower(account_name);
		return "授权成功";
	}
	@RequestMapping(value="deletePower",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public  String deletePower(String  account_name) {
	
		System.out.println("sssss");
		userService.deletePower(account_name);
		return "撤销成功";
	}

}
