package com.oracle.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

public class TestTX {
	public static void main(String[] args) {
		Jedis jedis=new Jedis("192.168.23.128",6379);
		Transaction transaction = jedis.multi();
		transaction.set("k4","v4");
		transaction.set("k5","v5");
		transaction.exec();
		System.out.println("ok");
	}
}
