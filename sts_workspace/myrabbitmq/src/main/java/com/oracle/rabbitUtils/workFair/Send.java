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
		//��ȡ����
		Connection con=ConnectionUtils.getConnection();
		
		//��ȡchannel
		Channel channel=con.createChannel();
		//��������
		channel.queueDeclare(QUEUE_NAME,false,false,false,null);
		/**
		 * ÿ�������߷���ȷ����Ϣ֮ǰ����Ϣ���в�������һ����Ϣ�������ߣ�һ��ֻ����һ����Ϣ
		 * ���Ʒ��͸�ͬһ�������߲��ó���һ����Ϣ
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
