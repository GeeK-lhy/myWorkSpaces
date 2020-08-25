package com.oracle.dao;

import java.util.List;

import com.oracle.jdbc.util.Dao;
import com.oracle.vo.City;

public class CityDao {
	public List<City> getCountry(){
		return Dao.query("select * from city where pid='0000'",City.class);
	}

	public List<City> getByParent(String pid){
		return Dao.query("select * from city where pid=?",City.class,pid);
	}
	public List<City> getZone(String id){
		return Dao.query("select * from city where id like concat(?,'__')",City.class,id);
	}
}
