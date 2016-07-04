package com.pknu.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dto.BBSDto;
import com.pknu.bbs.dto.MemberDto;
import com.pknu.bbs.dto.UpdateDto;


public interface BBSService {
	public ModelAndView list(int pageNum);
	public ModelAndView study(int pageNum);
	public int loginCheck(String id,String pass);
	public void insertArticle(BBSDto article);
	public ModelAndView getArticle(int articleNum, int fileStatus);
	public void deleteArticle(int articleNum);
	public void join(MemberDto member);
	public ModelAndView getUpdateArticle(int articleNum, int fileStatus);
	public void reply(BBSDto article, MultipartHttpServletRequest mReq);
	public ModelAndView updateArticle(MultipartHttpServletRequest mRequest,BBSDto article,UpdateDto updateDto);
	public FileSystemResource download(HttpServletResponse res, String storedFname);
	public void goodUp(int articleNum);
	
	public void asynFileUpload(MultipartHttpServletRequest mReq);
	
	public void joinCheckId(String inputId, HttpServletResponse resp);
	
	// 너님 정보
	public ModelAndView userProfile(String id);
	public void userProfileUpdate(MemberDto userInfo);
//	public void getUserProfile();
}
