package com.oracle.rabbitUtils.work;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;
import com.rabbitmq.client.AMQP.BasicProperties;

public class Recv1 {
	private static final String QUEUE_NAME="test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		//获取连接
		Connection con=ConnectionUtils.getConnection();
		
		//获取channel
		Channel channel=con.createChannel();
		//声明队列
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		//定义一个消费者
		Consumer consumer = new DefaultConsumer(channel) {
			//消息到达后出发这个方法
			@Override
			public void handleDelivery(String consumerTag, Envelope envelope, BasicProperties properties, byte[] body)
					throws IOException {
				String msg=new String(body,"utf-8");
				System.out.println("[1]recv msg:"+msg);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}finally {
					System.out.println("[1] done");
				}
			} 
		 };
		 boolean autoAck=true;
		 channel.basicConsume(QUEUE_NAME, autoAck,consumer);
	}

}
