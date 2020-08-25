package com.oracle.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.ReceiveAccidentVo;
import java.util.*;
@Repository
public interface ReceiveAccidentDao {
	public void insertReceiveAccident(ReceiveAccidentVo ra);
	public void updateStatus(@Param("status")String status,@Param("receiveaccident_id")String receiveaccident_id);
	public List<ReceiveAccidentVo> selectByStatus(@Param("receiveUser")String receiveUser);
	public ReceiveAccidentVo selectById(@Param("id")String id);
}
