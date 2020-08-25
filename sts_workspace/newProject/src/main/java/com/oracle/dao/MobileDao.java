package com.oracle.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Mobile;

import java.math.BigInteger;
import java.util.*;
@Repository
public interface MobileDao {
	
	public void addMobiles(Map<String,Object>map);
	public Mobile getNumber(@Param("number")BigInteger number);
	public void updateAvailable(@Param("number") BigInteger number);
	public int checkAvailable();
}
