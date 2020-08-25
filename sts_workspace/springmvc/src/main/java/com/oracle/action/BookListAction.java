package com.oracle.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.vo.BookList;

@Controller
public class BookListAction {
	@RequestMapping("/mantBooks")
	public String manyBooks(BookList bl) {
		System.out.println(bl);
		return "success";
	}
}
