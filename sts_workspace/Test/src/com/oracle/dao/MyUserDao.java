package com.oracle.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public interface MyUserDao {
	public List<Map<String,Object>> selectLeader(@Param("unit")String unit,@Param("roleid")String roleid);
	public String selectRoleId(@Param("userid")String userid);
}
