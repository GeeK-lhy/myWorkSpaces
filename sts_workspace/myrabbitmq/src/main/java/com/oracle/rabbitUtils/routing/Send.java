package com.oracle.rabbitUtils.routing;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;

public class Send {

	private static final String  EXCHANGE_NAME="test_exchange_direct";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		Channel channel=con.createChannel();
		//����������
		channel.exchangeDeclare(EXCHANGE_NAME,"direct");//
		//������Ϣ
		String msg="hello direct";
		String routingKey="info";
		channel.basicPublish(EXCHANGE_NAME, routingKey, null, msg.getBytes());
		System.out.println("Send : "+msg);
		channel.close();
		con.close();
	}

}
