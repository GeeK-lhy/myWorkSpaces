package com.oracle.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.service.BookService;
import com.oracle.vo.Book;

@Controller

//@SessionAttributes(names= {"userName","bookName"})
public class BookAction {
	@RequestMapping("/getJsons")	
	@ResponseBody
	public List<Book> getJson() {
		return service.getAll();
	}
	
	@RequestMapping(value="/getText",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getText() {
		return"<a href='http://www.163.com'>hellow word</a>";
	}
	
	@RequestMapping(value="/getBook",produces="application/jason;charset=UTF-8")	
	@ResponseBody
	public Book getBook(int isbn) {
		return service.getBookById(isbn);
	}
	
	@ModelAttribute
	public Book	bookModel() {
		Book book=new Book(9998,"人类简史",99);
		System.out.println("modelAttribute方法被调用"+book);
		return book;
	}
	
	@Autowired
	BookService service;
	@RequestMapping("/list")
	public String getAll(@RequestParam(value="start",required=false,defaultValue="1")int start,Map<String,Object>map){
		PageHelper.startPage(start,4);
		List<Book> list=service.getAll();
		map.put("list", list);
		return "bookList";
	}
	@RequestMapping("/list2/{start}")
	public String getAll2(@PathVariable(value="start",required=false) int start,Map<String,Object>map){
		PageHelper.startPage(start,4);
		List<Book> list=service.getAll();
		PageInfo<Book> info=new PageInfo<Book>(list); 
		map.put("pageInfo",info );
		return "bookList";
	}
	
	@RequestMapping("/save")
	public String addBook(Book book) {
		service.save(book);
		return "redirect:list";
	}
	@RequestMapping("/{path}")
	public String jsPath(@PathVariable("path") String path) {
	return path;	
	}
	
	@RequestMapping("/getBook1")
	public String getBook1(Map<String,Object> map) {
		Book b=new Book();
		b.setIsbn(333);
		b.setBookName("hhhhhh");
		b.setPrice(100);
		map.put("book",b);
		map.put("userName","Lhy");
		map.put("bookName","wyj");
		return "viewBook";
	}
	
//	@RequestMapping("/getBook")
//	public String getBook(Model model) {
//		Book b=new Book();
//		b.setIsbn(123);
//		b.setBookName("melo");
//		b.setPrice(66);
//		model.addAttribute("book",b);
//		return "viewBook";
//		
//	}
//	
//	@RequestMapping("/getBook")
//	public ModelAndView getBook() {
//		ModelAndView mv=new ModelAndView();
//		Book b=new Book();
//		b.setIsbn(123);
//		b.setBookName("melo");
//		b.setPrice(66);
//		mv.addObject("book",b);
//		
//		mv.setViewName("viewBook");
//		return mv;
//	}

}
