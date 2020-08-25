package com.oracle.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

public class TestTx2 {

	public static void main(String[] args) {
		TestWatch test=new TestWatch();
		boolean retValue=test.transMethod();

	}

}
class TestWatch{
	public boolean transMethod() {
		Jedis jedis = new Jedis("192.168.23.128",6379);
		int balance;//可用余额
		int debt;//欠额
		int amtToSubtract=10;//实刷额度
		
		jedis.watch("balance");
		//其他程序修改了balance；
		balance=Integer.valueOf(jedis.get("balance"));
		if(balance<amtToSubtract) {
			jedis.unwatch();
			System.out.println("modify");
			return false;
		}else {
			Transaction transaction=jedis.multi();
			transaction.decrBy("balance",amtToSubtract);
			transaction.incrBy("debt",amtToSubtract);
			transaction.exec();
			System.out.println(Integer.valueOf(jedis.get("balance")));
			System.out.println(Integer.valueOf(jedis.get("debt")));
			
			return true;
		}
	}
}
