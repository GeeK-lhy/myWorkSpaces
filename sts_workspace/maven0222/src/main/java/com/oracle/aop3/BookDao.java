package com.oracle.aop3;

public interface BookDao {
	@Sql("insert into books values(null,'ңԶ����',66)")
	public void save();
	
	@Sql("delete from books where isbn=?")
	public void delete(int isbn);
}
