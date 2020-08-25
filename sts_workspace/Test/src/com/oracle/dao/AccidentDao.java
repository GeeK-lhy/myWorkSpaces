package com.oracle.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Accident;
import com.oracle.vo.ReceiveAccidentVo;
import java.util.*;
@Repository
public interface AccidentDao {
	public void saveAccident(Accident accident);
}
