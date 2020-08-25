package com.oracle.rabbitUtils.workFair;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;

public class Send {
	/*					|	C1	
	 * p----Queue-----	|
	 * 					|	C2
	 */
	private static final String QUEUE_NAME="test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException, InterruptedException {
		//获取连接
		Connection con=ConnectionUtils.getConnection();
		
		//获取channel
		Channel channel=con.createChannel();
		//声明队列
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		/**
		 * 每个消费者发送确认消息之前，消息队列不发送下一个消息到消费者，一次只处理一个消息
		 * 限制发送给同一个消费者不得超过一条消息
		 */
		int prefetchCount=1;
		channel.basicQos(prefetchCount);
		for(int i=0;i<20;i++) {
			String msg="hellow "+i;
			System.out.println("WQ send :"+ msg);
			channel.basicPublish("", QUEUE_NAME, null, msg.getBytes());
	
			Thread.sleep(i*20);

		}
		channel.close();
		con.close();
	}

}
