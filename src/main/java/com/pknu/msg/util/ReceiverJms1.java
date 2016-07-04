package com.pknu.msg.util;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.pknu.msg.dao.MsgDao;
import com.pknu.msg.vo.JmsVO;

public class ReceiverJms1 implements MessageListener{
	@Autowired
	MsgDao msgDao;
	
	JmsVO jv;
	@Override
	public void onMessage(Message message) {		// 여기서 메시지를 받음
		System.out.println(message+"111");
		if(message instanceof ObjectMessage){					
			try{	
				jv=(JmsVO)((ObjectMessage) message).getObject();
				msgDao.insertMsg(jv);		// 메시지를 DB에 넣음
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}	
	

}
