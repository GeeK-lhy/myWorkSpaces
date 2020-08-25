package com.oracle.redis;

import com.oracle.redisUtil.JedisPoolUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class TestJedisPool {

	public static void main(String[] args) {
		JedisPool jedisPool =JedisPoolUtil.getJedisPool();
		
		Jedis jedis=null;
		try {
		jedis=jedisPool.getResource();
		jedis.set("aa", "bb");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JedisPoolUtil.release(jedisPool, jedis);
		}

	}

}
