package com.oracle.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileAction {
	@RequestMapping("/upLoad")
	public String upLoad(HttpSession session,@RequestParam("userName")String userName,@RequestParam("pic")MultipartFile pic) {
		String path=session.getServletContext().getRealPath("/pic/");
		System.out.println("userName:"+userName);
		System.out.println("fileName:"+pic.getOriginalFilename());
		System.out.println("文件大小:"+pic.getSize());
		try {
			pic.transferTo(new File(path+pic.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}
