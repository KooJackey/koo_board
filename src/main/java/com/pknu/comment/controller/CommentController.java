package com.pknu.comment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.comment.dto.CommentDto;
import com.pknu.comment.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	
//	@RequestMapping("/commentWrite.comment")
//	@ResponseBody
//	public List<CommentDto> commentWrite(HttpSession session,CommentDto comment){
//		comment.setId((String)session.getAttribute("id"));
//		return commentService.commentWrite(comment);
//	}
	
	
//	@ResponseBody 이용. 알아서 JSON으로 바꿔줌
//	@RequestMapping("/commentRead.comment")
//	public @ResponseBody List<CommentDto> commentRead(int articleNum, int commentRow){
//		return commentService.commentRead(articleNum, commentRow);
//	}
	
	
	@RequestMapping("/commentWrite.comment")
	@ResponseBody
	public ModelAndView commentWrite(HttpSession session,CommentDto comment){
		comment.setId((String)session.getAttribute("id"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("comment", commentService.commentWrite(comment));
		mav.setViewName("JSON");
		return mav;
	}
	
//	MappingJacksonView 이용하여 JSON
//	comment-context.xml에 bean id가 JSON인 놈을 만들건데 org.springframework.web.servlet.view.BeanNameViewResolver 가 찾는다. 
	@RequestMapping("/commentRead.comment")
	public  ModelAndView commentRead(int articleNum, int commentRow){
		ModelAndView mav = new ModelAndView();
		mav.addObject("comment", commentService.commentRead(articleNum, commentRow));
		mav.setViewName("JSON");
		return mav;
	}
	
}
