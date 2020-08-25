package com.oracle.rabbitUtils.routing;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.AMQP.BasicProperties;

public class Recv1 {
	private static final String  QUEUE_NAME="test_queue_direct_1";
	private static final String  EXCHANGE_NAME="test_exchange_direct";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		Channel channel=con.createChannel();
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		channel.queueBind(QUEUE_NAME, EXCHANGE_NAME, "error");
		channel.basicQos(1);
		//����һ��������
				Consumer consumer = new DefaultConsumer(channel) {
					//��Ϣ���������������
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
							channel.basicAck(envelope.getDeliveryTag(), false);
						}
					} 
				 };
				 boolean autoAck=false;//�Զ�Ӧ��false
				 channel.basicConsume(QUEUE_NAME, autoAck,consumer);
	}

}
