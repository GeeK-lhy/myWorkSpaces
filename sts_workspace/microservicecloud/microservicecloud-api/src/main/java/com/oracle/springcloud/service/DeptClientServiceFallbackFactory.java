package com.oracle.springcloud.service;
import com.oracle.springcloud.entity.*;

import java.util.List;

import org.springframework.stereotype.Component;

import feign.hystrix.FallbackFactory;
@Component
public class DeptClientServiceFallbackFactory implements FallbackFactory<DeptClientService> {

	@Override
	public DeptClientService create(Throwable throwable) {
	 
		return new DeptClientService() {
			@Override
			public Dept get(Long id)
			{
				Dept dept=new Dept();
				dept.setDeptno(id);
				dept.setDname("该ID"+id+"没有对应得信息，nul--@HystrixCommand");
				dept.setDb_source("no this database in MySql");
			//	return new Dept().setDeptno(id).setDname("该ID"+id+"没有对应得信息，nul--@HystrixCommand").setDb_source("no this database in MySql");
				return dept;
			}

			@Override
			public List<Dept> list()
			{
				return null;
			}

			@Override
			public boolean add(Dept dept)
			{
				return false;
			}
		};
	}

}
