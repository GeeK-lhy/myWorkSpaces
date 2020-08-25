package com.oracle.dao;

import org.springframework.stereotype.Repository;

import com.oracle.vo.ChargeRule;

@Repository
public interface ChargeRuleDao {
	public void save(ChargeRule cr);
}
