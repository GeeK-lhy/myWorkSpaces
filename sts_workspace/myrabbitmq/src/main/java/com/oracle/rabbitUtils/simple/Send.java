package com.oracle.rabbitUtils.simple;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;

public class Send {
	private static final String QUEUE_NAME="test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		
		//�������л�ȡһ��ͨ��
		Channel channel=con.createChannel();
		//������������
		channel.queueDeclare(QUEUE_NAME, false, false, false, null);
	
		String msg="hellow simple";
		
		
		channel.basicPublish("", QUEUE_NAME, null, msg.getBytes());
		
		System.out.println("---sendMsg"+msg);
		
		channel.close();
		con.close();

	}

}
