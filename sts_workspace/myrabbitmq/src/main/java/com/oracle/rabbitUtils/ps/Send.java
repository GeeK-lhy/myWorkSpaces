package com.oracle.rabbitUtils.ps;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.*;

public class Send {
	private static final String  EXCHANGE_NAME="test_exchange_fanout";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		Channel channel=con.createChannel();
		//声明交换机
		channel.exchangeDeclare(EXCHANGE_NAME,"fanout");//分发
		//发送消息
		String msg="hello ps";
		channel.basicPublish(EXCHANGE_NAME, "", null, msg.getBytes());
		System.out.println("Send : "+msg);
		channel.close();
		con.close();
	}

}
