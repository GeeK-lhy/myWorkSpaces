package com.oracle.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.ChargeDao;
import com.oracle.dao.ChargeRuleDao;
import com.oracle.vo.Charge;
import com.oracle.vo.ChargeRule;

@Service
public class ChargeService {
	@Autowired
	ChargeDao dao;
	@Autowired
	ChargeRuleDao dao2;
	public List<Charge> getCharge(){
		List<Charge>list=dao.getCharge();
		return list;
	}
	public void updateCharge(int n,String charge_Code) {
		dao.updateCharge(n,charge_Code);
	}
	public int getChargeByCode(String s) {
		return	dao.getChargeByCode(s);
	}
	public void save(ChargeRule cr) {
		dao2.save(cr);
	}
	public List<Integer>getCharges(String []s){
		return dao.getCharges(s);
		
	}
}
