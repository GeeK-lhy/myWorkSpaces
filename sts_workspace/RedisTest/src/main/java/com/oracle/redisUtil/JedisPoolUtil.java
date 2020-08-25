package com.oracle.redisUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisPoolUtil {
	private static volatile JedisPool jedisPool=null;
	private JedisPoolUtil(){}
	
	public static JedisPool getJedisPool() {
		if(jedisPool==null) {
			synchronized(JedisPoolUtil.class) {
				if(jedisPool == null) {
				JedisPoolConfig poolConfig = new JedisPoolConfig();
					poolConfig.setMaxIdle(32);
					poolConfig.setMaxWaitMillis(100*10000);
					poolConfig.setMaxTotal(1000);
					poolConfig.setTestOnBorrow(true);
					jedisPool =new JedisPool(poolConfig,"192.168.23.128",6379);
				}
			}
		}
		
		return jedisPool;
	}
	public static void release(JedisPool jedisPool,Jedis jedis) {
		if(jedis != null) {
			jedis.close();
		}
	}
	
}
