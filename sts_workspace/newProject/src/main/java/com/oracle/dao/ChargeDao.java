package com.oracle.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Charge;

@Repository
public interface ChargeDao {
	public List<Charge> getCharge();
	public void updateCharge(@Param("charge") int n,@Param("charge_Code") String charge_Code);
	public int getChargeByCode(@Param("charge_Code")String s);
	public List<Integer> getCharges(String[] ids);
}
