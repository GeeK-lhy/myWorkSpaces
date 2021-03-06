package com.oracle.dao;
import java.util.List;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.PageInfor;
import com.oracle.vo.*;
public class BookDao {
	public List<Book>  getAll(){
		
		return Dao.query("select * from books ",Book.class);
	} 
	public void insert(Book book) {
		Dao.executeSql("insert into books values(null,?,?)",book.getBookName(),book.getPrice());
	}
	public void getByPage(PageInfor pageinfor){
	 List list=Dao.query("select *from books limit ?,?", Book.class,(pageinfor.getCurrentPage()-1)*pageinfor.getPageSize(),pageinfor.getPageSize());
	 pageinfor.setList(list);
	 Long count=(Long)Dao.queryOne("select count(*) from books")[0];
	 pageinfor.setRecordCount(count.intValue());
	}
	public void delete(Integer[]isbn) {
		StringBuffer sql=new StringBuffer();
		for(int i=0;i<isbn.length;i++) {
			sql.append("?");
			if(i<isbn.length-1) {
				sql.append(",");
			}
		}
	Dao.executeSql("delete from books where isbn in ("+sql.toString()+")",isbn);	
	}
	public Book getBookById(int isbn) {
		return Dao.queryOne("select * from books where isbn=? order by isbn limit 0,4", Book.class,isbn);
	}
	public void update(Book book) {
		Dao.executeSql("update books set bookName=?,price=? where isbn=?",book.getBookName(),book.getPrice(),book.getIsbn());
	}
	public List<Book> select(String s) {
		return Dao.query("select * from books where bookName like '%"+s+"%'", Book.class);
	}
}
