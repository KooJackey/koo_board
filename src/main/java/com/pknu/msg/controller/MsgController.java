package com.pknu.msg.controller;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dao.BBSDao;
import com.pknu.msg.service.MsgService;
import com.pknu.msg.service.MsgServiceImpl;
import com.pknu.msg.util.SenderJms;
import com.pknu.msg.vo.JmsVO;

@Controller
public class MsgController {
	@Resource
	private SenderJms senderJms;	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	ModelAndView mav;
	
	@Autowired
	MsgService msgService; 
	
	@RequestMapping(value = "/msgForm.msg")
	public ModelAndView home(Locale locale, Model model, HttpSession session,
			@ModelAttribute("subID") String subID) {		
//		senderJms.sendJms();
		System.out.println("컨츄롤러 model.toString -> "+model.toString());
		System.out.println(locale.toString());
		return msgService.id();
	}
	
	@RequestMapping(value="/send.msg")
	public void sendMsg(JmsVO jms, HttpSession session){
		jms.setPubID((String)session.getAttribute("id"));
		senderJms.sendJms(jms);
		System.out.println("send.msg 요청 발동 -->> "+jms.toString());
		
	}
	
	// 받은 쪽지 불러오기
	@RequestMapping(value="/readSub.msg")
	public ModelAndView subMsg(JmsVO jms, HttpSession session){
		String id=(String)session.getAttribute("id");
//		mav=msgServiceImpl.getSubMsg(id);
		System.out.println("받은 쪽지 id -> "+id);
		return mav=msgService.getSubMsg(id);
	}
	
	// 보낸 쪽지 불러오기
	@RequestMapping(value="/readPub.msg")
	public ModelAndView pubMsg(JmsVO jms, HttpSession session){
		String id=(String)session.getAttribute("id");
//		mav=msgServiceImpl.getSubMsg(id);
		System.out.println("보낸 쪽지 id -> "+id);
		return mav=msgService.getPubMsg(id);
	}
	
	// 쪽삭
	@RequestMapping(value="/delete.msg")
	public String pubMsg(HttpSession session, @RequestParam("msgNo")int msgNo){
		System.out.println("쪽지 넘버 - "+msgNo);
		msgService.deleteMsg(msgNo);
		return "redirect:/readSub.msg";
	}
	
}
