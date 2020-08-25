package com.oracle.dao;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Books;

@Repository
public class BookDao {
	@Autowired
	JdbcTemplate jdbc;
	
	public void save(Books book) {
		jdbc.update("insert into books values(?,?,?)",book.getIsbn(),book.getName(),book.getPrice());
		
	}
	public int getCount() {
		return 	jdbc.queryForObject("select count(*) from books",Integer.class);
	}
	public void getBookById(Integer isbn) {
		System.out.println(jdbc.queryForMap("select * from books where isbn=?",isbn));
	}
	public List<Books> getBooks(){
		return jdbc.query("select * from books", new RowMapper<Books>() {

			@Override
			public Books mapRow(ResultSet rs, int arg1) throws SQLException {
				Books b=new Books();
				b.setIsbn(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setPrice(rs.getInt(3));
				return b;
			}
			
		});
	}
}
