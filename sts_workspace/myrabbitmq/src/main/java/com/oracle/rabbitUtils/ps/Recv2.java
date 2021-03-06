package com.oracle.rabbitUtils.ps;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.AMQP.BasicProperties;

public class Recv2 {

	private static final String  QUEUE_NAME="test_queue_fanout_sms";
	private static final String  EXCHANGE_NAME="test_exchange_fanout";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		Channel channel=con.createChannel();
		
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		//绑定到交换机
		channel.queueBind(QUEUE_NAME, EXCHANGE_NAME,"");
channel.basicQos(1);//保证一次只分发一个
		
		//定义一个消费者
		Consumer consumer = new DefaultConsumer(channel) {
			//消息到达后出发这个方法
			@Override
			public void handleDelivery(String consumerTag, Envelope envelope, BasicProperties properties, byte[] body)
					throws IOException {
				String msg=new String(body,"utf-8");
				System.out.println("[2]recv msg:"+msg);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}finally {
					System.out.println("[2] done");
					channel.basicAck(envelope.getDeliveryTag(), false);
				}
			} 
		 };
		 boolean autoAck=false;//自动应答false
		 channel.basicConsume(QUEUE_NAME, autoAck,consumer);

	}

}
