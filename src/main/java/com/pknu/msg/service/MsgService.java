package com.pknu.msg.service;

import org.springframework.web.servlet.ModelAndView;

public interface MsgService {
	public ModelAndView id();
	public ModelAndView getSubMsg(String id);
	public ModelAndView getPubMsg(String id);
	public void deleteMsg(int msgNo);
}
