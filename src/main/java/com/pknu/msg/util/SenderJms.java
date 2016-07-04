package com.pknu.msg.util;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import com.pknu.msg.vo.JmsVO;

public class SenderJms {
	@Resource
	JmsTemplate jmsTemplate;

	public void sendJms(JmsVO jms) {
		// final JmsVO jv = new JmsVO();
		jmsTemplate.send(new MessageCreator() {
			@Override
			public Message createMessage(Session sess) throws JMSException {
				// 메시지생성
				return sess.createObjectMessage(jms);
			}
		});
		System.out.println("메시지 전송 완료");

	}

}
