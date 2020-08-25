package com.oracle.redis;

import redis.clients.jedis.Jedis;

public class TestMS {

	public static void main(String[] args) {
		Jedis jedis_M = new Jedis("192.168.23.128",6379);
		Jedis jedis_S = new Jedis("192.168.23.128",6380);
		jedis_S.slaveof("192.168.23.128",6379);
		jedis_M.set("v1", "k1");
		String result=jedis_S.get("k1");
		System.out.println(result);
	}

}
