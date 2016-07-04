package com.pknu.msg.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dto.BBSDto;
import com.pknu.msg.dao.MsgDao;
import com.pknu.msg.vo.JmsVO;

@Service
public class MsgServiceImpl implements MsgService {
	@Inject
	MsgDao msgDao;
	
	List<BBSDto> bbsDtoList;
	JmsVO jv;
	List<JmsVO> msgList;
	ModelAndView mav;
	
	@Override
	public ModelAndView id(){
		mav=new ModelAndView();
		bbsDtoList=msgDao.requestID();
		mav.addObject("idList", bbsDtoList);
		mav.setViewName("msgForm");
		
		return mav;
	}
	
	@Override
	public ModelAndView getSubMsg(String id){
		mav = new ModelAndView();	// 내가 이 한줄 때문에 4시간 넘게 뺑이를 치다니
		int selectMsg=0;
		msgList = msgDao.getSubMsg(id);
		System.out.println(msgList.toString());
		mav.addObject("msgList", msgList);
		mav.addObject("selectMsg", selectMsg);
		mav.setViewName("msgRead");
		return mav;
	}
	
	@Override
	public ModelAndView getPubMsg(String id){
		mav = new ModelAndView();
		int selectMsg=1;
		msgList = msgDao.getPubMsg(id);
		mav.addObject("msgList", msgList);
		mav.addObject("selectMsg", selectMsg);
		mav.setViewName("msgRead");
		return mav;
	}
	
	// 쪽지 삭제욤~~
	@Override
	public void deleteMsg(int msgNo) {
		msgDao.deleteMsg(msgNo);
		
	}
	

}
