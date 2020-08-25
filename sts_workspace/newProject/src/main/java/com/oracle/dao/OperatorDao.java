package com.oracle.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Operator;
@Repository
public interface OperatorDao {
	public Operator getOperator(Map<String,Object>map);
	public int getAdmin(@Param("id")int id);
}
