package com.oracle.rabbitUtils.util;

import com.rabbitmq.client.Connection;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.*;

public class ConnectionUtils {

	/**
	 * ��ȡMQ����
	 * @throws TimeoutException 
	 * @throws IOException 
	 */
	public static Connection getConnection() throws IOException, TimeoutException {
		//����һ�����ӹ���
		ConnectionFactory factory=new ConnectionFactory();
		//���÷����ַ
		factory.setHost("127.0.0.1");
		//AMQP 5672
		factory.setPort(5672);
		//vhost
		factory.setVirtualHost("/vhost_mmr");
		
		//�û���
		factory.setUsername("user_mmr");
		
		//����
		factory.setPassword("123");
	
		return 	factory.newConnection();
		
	}
}
