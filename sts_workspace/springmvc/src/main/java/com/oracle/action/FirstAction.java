package com.oracle.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.vo.Book;

@Controller
@RequestMapping("/book")
public class FirstAction {
	
	@RequestMapping(value="/first/{isbn}")
	public String first(@PathVariable("isbn") int isbn) {
		System.out.println("请求了我,"+isbn);
		return "success";
	}
	
//	@RequestMapping(value="/save")
//	public String save(Book book) {
//			System.out.println(book);
//		return "success";
//	}
	
//	@RequestMapping(value="/first",method=RequestMethod.POST)
//	public String first1() {
//		System.out.println("请求了我，这是get请求");
//		return "success";
//	}
	
}
