package com.oracle.action;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.service.OperatorService;
import com.oracle.sessionInfo.SessionInfo;
import com.oracle.vo.Operator;

@Controller
//@SessionAttributes(names="operator")
public class LoginAction {
	@Autowired
	OperatorService service;
	@RequestMapping("/toindex")
	public String login(String loginname,String passwords,HttpServletRequest request) {
		Map<String,Object>map=new HashMap<>();
		map.put("operator_Id", loginname);
		map.put("operator_Pwd", passwords);
		Operator o=service.getOperator(map);
			request.getSession().setAttribute("operator", o);		
		if(o!=null) {
			if(!SessionInfo.getSessionMap().contains(o.getId())) {
				SessionInfo.getSessionMap().put(o.getId(),request.getSession());
			}else {
				SessionInfo.getSessionMap().remove(o.getId());
				SessionInfo.getSessionMap().put(o.getId(),request.getSession());
			}
		
		return "index";
		}
		else
			return "redirect:/login.jsp";
	}
}
