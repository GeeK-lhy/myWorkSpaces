package com.oracle.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.SendAccident;

@Repository
public interface SendAccidentDao {
	public void insertSendAccident(SendAccident sa);
	public void editSendAccident(SendAccident sa);
	public void updateStatus(@Param("newStatus")int newStatus,@Param("sendaccident_id")String sendaccident_id);
}
