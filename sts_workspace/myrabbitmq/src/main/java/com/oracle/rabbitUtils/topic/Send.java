package com.oracle.rabbitUtils.topic;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.oracle.rabbitUtils.util.ConnectionUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;

public class Send {
	private static final String  EXCHANGE_NAME="test_exchange_topic";
	public static void main(String[] args) throws IOException, TimeoutException {
		Connection con=ConnectionUtils.getConnection();
		Channel channel=con.createChannel();
		//����������
		channel.exchangeDeclare(EXCHANGE_NAME,"topic");
		String msgString="��Ʒ������";
		channel.basicPublish(EXCHANGE_NAME, "goods.add", null, msgString.getBytes());
		System.out.println("----send"+msgString);
		channel.close();
		con.close();

	}

}
