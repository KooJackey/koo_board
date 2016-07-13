package com.pknu.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dto.MemberDto;
import com.pknu.bbs.service.BBSService;

@Controller
@Transactional
public class MemberController {
	@Autowired
	BBSService bbsService;
	
	ModelAndView mav;
	
	@RequestMapping("/joinCheckId.bbs")
	public void joinCheckId(String inputId, HttpServletResponse resp){
		
		bbsService.joinCheckId(inputId, resp);
	
	}
	
	// 너님 정보 보기
	@RequestMapping("/userProfile.bbs")
	public ModelAndView profile(HttpSession session) {
		String id=(String) session.getAttribute("id");
		mav= new ModelAndView();
		mav=bbsService.userProfile(id);
		mav.setViewName("member/userProfile");
		System.out.println("프로필 보기 완료 "+mav.toString());
		return mav;
	}
		
	// 너님 정보 수정하기
	@RequestMapping("/userProfileUpdate.bbs")
		public String profileUpdate(MemberDto userInfo, HttpSession session, MultipartFile profile) {
			userInfo.setId((String) session.getAttribute("id"));
//			System.out.println("req.toString ->>>>>>>>"+req.getParameter("userProfile"));
			
			String fileName=profile.getOriginalFilename();	
			userInfo.setPicture(fileName);
			File file = new File("c:/upload/profile/" + fileName);
            try {
				profile.transferTo(file);
			}  catch (IOException e) {
				e.printStackTrace();
			}
            bbsService.userProfileUpdate(userInfo);
            System.out.println("프로필 수정 완료 "+userInfo.toString());
			return "redirect:/userProfile.bbs";
		}
		
}
