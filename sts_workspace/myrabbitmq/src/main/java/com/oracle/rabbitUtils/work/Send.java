package com.oracle.rabbitUtils.work;

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
		
		for(int i=0;i<50;i++) {
			String msg="hellow "+i;
			System.out.println("WQ send :"+ msg);
			channel.basicPublish("", QUEUE_NAME, null, msg.getBytes());
	
			Thread.sleep(i*20);

		}
		channel.close();
		con.close();
	}

}
