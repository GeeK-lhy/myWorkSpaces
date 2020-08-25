package com.oracle.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.vo.User;

@Controller
public class UserAction {

	@RequestMapping("/saveUser")
	public String getUser(User user) {
		System.out.println(user);
		return "success";
	}
}
