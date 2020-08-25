package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.Emp;

public interface EmpDao {
	public List<Emp> getAll();
	public Emp getEmpByPwd(@Param("empNo") String empno,@Param("password") String passwd);
}
