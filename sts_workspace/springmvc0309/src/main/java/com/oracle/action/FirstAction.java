package com.oracle.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FirstAction {
	@RequestMapping("/first")
	public String first(String userName,String password) {
		System.out.println("�������ң�"+userName+","+password);
		return "success";
	}
}
