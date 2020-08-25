package com.oracle.springcloud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.oracle.springcloud.entity.Dept;

@RestController
public class DeptController_Consumer {
	//private static final String REST_UURL_PREFIX="http://localhost:8001";
	private static final String REST_UURL_PREFIX="http://MICROSERVICECLOUD-DEPT";
	@Autowired
	private RestTemplate restTemplate;
	@RequestMapping(value="/consumer/dept/add")
	public boolean add(Dept dept) {
		return restTemplate.postForObject(REST_UURL_PREFIX+"/dept/add", dept, Boolean.class);
	}
	@RequestMapping(value="/consumer/get/{id}")
	public Dept get(@PathVariable("id")Long id) {
		return restTemplate.getForObject(REST_UURL_PREFIX+"/dept/get"+id,Dept.class);
	}
	@RequestMapping(value="/consumer/dept/list")
	public List<Dept> list() {
		return restTemplate.getForObject(REST_UURL_PREFIX+"/dept/list",List.class);
	}
}
