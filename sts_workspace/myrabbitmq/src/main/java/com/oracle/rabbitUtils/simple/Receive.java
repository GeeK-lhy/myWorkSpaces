package com.oracle.rabbitUtils.simple;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;
import com.rabbitmq.client.AMQP.BasicProperties;

/*
 * 消费者获取消息
 */
public class Receive {
	private static final String QUEUE_NAME="test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con = ConnectionUtils.getConnection();
		
		Channel channel=con.createChannel();
		
		//队列申明
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		
		DefaultConsumer consumer = new DefaultConsumer(channel) {
			//获取到到达的消息
			@Override
			public void handleDelivery(String consumerTag, Envelope envelope, BasicProperties properties, byte[] body) throws UnsupportedEncodingException {
			String msg=new String(body,"utf-8");
			System.out.println("new api recv:"+msg);	
			}
		};
		//监听队列
		channel.basicConsume(QUEUE_NAME, true,consumer);
	}

}
