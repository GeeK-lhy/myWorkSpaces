package com.oracle.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.Student;
public interface StudentDao {
	public List<Student> getAll();
	public int getCount();
	public Map<String,Object> getAvgCount();
	public List<Map<String,Object>> getDegree();
	public List<Student> getByPage(Map<String,Integer> map);
	public List<Student> getPages(@Param("start") Integer start,@Param("size") Integer size);
	public List<Map<String,Object>> getDetials();
	
	public List<Student> fuzzyQuery(String name);
	
	public List<Student> orderBy(@Param("name")String  str);

}
