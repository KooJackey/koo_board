package com.pknu.msg.dao;

import java.util.List;

import com.pknu.bbs.dto.BBSDto;
import com.pknu.msg.vo.JmsVO;

public interface MsgDao {
	public List<BBSDto> requestID();			// id 읽어옴잼
	public void insertMsg(JmsVO jv);			// 메시지 보낸거 DB에 저장
	public List<JmsVO> getSubMsg(String id);	// 받은 메시지 읽어옴
	public List<JmsVO> getPubMsg(String id);	// 보낸 메시지 읽어옴
	public void deleteMsg(int msgNo);			// 메시지 삭제

}
