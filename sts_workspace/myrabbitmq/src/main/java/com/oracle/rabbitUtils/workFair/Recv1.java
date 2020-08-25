package com.oracle.rabbitUtils.workFair;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;
import com.rabbitmq.client.AMQP.BasicProperties;

public class Recv1 {
	private static final String QUEUE_NAME="test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		//��ȡ����
		Connection con=ConnectionUtils.getConnection();
		
		//��ȡchannel
		Channel channel=con.createChannel();
		//��������
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
	
		channel.basicQos(1);//��֤һ��ֻ�ַ�һ��
		
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
