package com.pknu.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dto.BBSDto;
import com.pknu.bbs.dto.MemberDto;
import com.pknu.bbs.dto.UpdateDto;
import com.pknu.bbs.service.BBSService;
import com.pknu.bbs.service.LoginStatus;

@Controller
@Transactional
public class BBSController {
	@Autowired
	BBSService bbsService;
	ModelAndView mav;	
	
	@RequestMapping("/")	// 요청 없을때
	public String index(){		
		
		return "redirect:/list.bbs?pageNum=1";		
	}
	@RequestMapping("/test.bbs")	// 요청 없을때
	public String test(){		
		
		return "bbs/car";		
	}
	
	@Transactional
	@RequestMapping("/list.bbs")
	public ModelAndView list(@RequestParam("pageNum") int pageNum,
//			@RequestParam("board") String board,
			HttpServletRequest request){	
		System.out.println("목록 요청 ip : "+request.getRemoteAddr()+" / 포트 : "+request.getLocalPort());
		return bbsService.list(pageNum);	
	}
	
	@RequestMapping("/study.bbs")
	public ModelAndView study(@RequestParam("pageNum") int pageNum, 
//			@RequestParam("board") String board,
			HttpServletRequest request){	
		System.out.println("목록 요청 ip : "+request.getRemoteAddr());
		return bbsService.study(pageNum);	
	}
	
	@RequestMapping(value="/writeForm.bbs")
	public String writeForm(HttpSession session,HttpServletResponse res){
		return "writeForm";
	}
	
//	글쓰기
	@RequestMapping(value="/write.bbs",method=RequestMethod.POST)
	public String write(@ModelAttribute("article") BBSDto article,HttpSession session, HttpServletRequest request){
		article.setId((String)session.getAttribute("id"));
		System.out.println("글쓴 사람 ip : "+request.getRemoteAddr());
		bbsService.insertArticle(article);	
		return "redirect:/list.bbs?pageNum=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/asynFile.bbs",method=RequestMethod.POST)
	public ModelAndView asynFile(BBSDto article,HttpSession session, MultipartHttpServletRequest req){
		article.setId((String)session.getAttribute("id"));
		mav=new ModelAndView();
		bbsService.asynFileUpload(req);	
		System.out.println("이게 출력되면 된거 ㅇㅇ");
		mav.setViewName("JSON");
		return mav;
	}
	
	@RequestMapping("/loginForm.bbs")
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping("/login.bbs")
	public String login(String id, String pass, String loginPath, HttpSession session){		
//		리턴값이 void면 뭐가 뷰가 되냐 -> 요청 이름이 뷰가 된다 위에 login저거말임
		int result=0;		
		result=bbsService.loginCheck(id,pass);
		
		String view=null;
		if(result==LoginStatus.OK){
			session.setAttribute("id", id);
			System.out.println("id : "+id+" 접속완료");
			if(loginPath.equals("")){
				view="redirect:/list.bbs?pageNum=1";
			}else{
				view="redirect:/write.bbs";
			}
		}else if(result==LoginStatus.PASS_FAIL){
			System.out.println("패스워드 틀림스");
		}else{
			System.out.println("머임?");
		}
		return view;
	}
	
	@RequestMapping(value="/logout.bbs")
	public String logout(HttpSession session){
		session.setAttribute("id", null);
		System.out.println("로그아웃완료");
		return "redirect:/list.bbs?pageNum=1";
	}
	
	@RequestMapping(value="/content.bbs")
	public ModelAndView readArticle(int articleNum,@ModelAttribute("pageNum") String pageNum, int fileStatus){
//		pageNum은 @ModelAttribute를 사용해서 자동으로 view까지 값이 전달된다.
		return bbsService.getArticle(articleNum,fileStatus);
	}
	
	@RequestMapping(value="/delete.bbs")
	public String deleteArticle(int articleNum){
		bbsService.deleteArticle(articleNum);
		return "redirect:/list.bbs?pageNum=1";
	}
	
	
	@RequestMapping(value="/update.bbs", method=RequestMethod.GET)
	public ModelAndView getUpdateArticle(@ModelAttribute("articleNum") int articleNum,
			@ModelAttribute("fileStatus") int fileStatus, 
			@ModelAttribute("pageNum") String pageNum){			
//		mav= new ModelAndView();		
		return bbsService.getUpdateArticle(articleNum,fileStatus);
	}
	
	@RequestMapping(value="/update.bbs", method=RequestMethod.POST)
	public ModelAndView updateArticle(BBSDto article,
//			아래와 같이 사용시에는 오류가 남, Integer는 set,get 메소드가 없음
//			@ModelAttribute("fileNumList") ArrayList<Integer> fileNumList,
//			UpdateDto를 만들어서 set,get 메소드를 사용해야지
//			jsp에서 복수개의 name 속성을 가지는 값이 넘오옴 
			UpdateDto updateDto,
			MultipartHttpServletRequest mRequest, 
			@ModelAttribute("pageNum") String pageNum){		
//		mav= new ModelAndView();		
		
		return bbsService.updateArticle(mRequest,article,updateDto);		
	}
	
//	@RequestMapping(value="/replyForm.bbs")
//	public String replyForm(int groupId, int pageNum, int depth, int pos){
//		mav= new ModelAndView();
//		mav.addObject("groupId", groupId);
//		mav.addObject("pageNum", pageNum);
//		mav.addObject("depth", depth);
//		mav.addObject("pos", pos);
//		mav.setViewName("replyForm");
//		return "replyForm";
//	}
	
//	@ModelAttribute는 객체를 받아야 함
	@RequestMapping(value="/replyForm.bbs")
	public String replyForm(@ModelAttribute("pageNum") String pageNum, 
			@ModelAttribute("depth") String depth, 
			@ModelAttribute("pos") String pos, 
			@ModelAttribute("groupId") String groupId){			
		return "replyForm";
	}
	
	@RequestMapping(value="/reply.bbs")
	public String reply(MultipartHttpServletRequest mReq, BBSDto article, String pageNum, HttpSession session, MultipartFile fname){
		article.setId((String)session.getAttribute("id"));
		bbsService.reply(article,mReq);	
		return "redirect:list.bbs?pageNum="+pageNum;
	}
	
////	@RequestMapping("/download.bbs")
////	public ModelAndView download(String originFname, String storedFname){
////		mav = new ModelAndView();
////		mav.addObject("originFname", originFname);
////		mav.addObject("storedFname", storedFname);
////		mav.setViewName("download");
////		return mav;
////		
////	}
//	
//	@RequestMapping(value="/download.bbs", produces="application/download")
//	@ResponseBody
//	public FileSystemResource download(HttpServletResponse res, String originFname, String storedFname){
//		return bbsService.download(res, originFname, storedFname);
//	}
	@RequestMapping(value="/download.bbs")
	@ResponseBody
	public FileSystemResource download(HttpServletResponse res, String storedFname){	
		return bbsService.download(res, storedFname);
	}
	
	@RequestMapping(value="/join.bbs")
	public String joinPage(){
		return "member/join";
	}
	
	@RequestMapping(value="/joinMember.bbs",method=RequestMethod.POST)
	public String join(@ModelAttribute("member") MemberDto member){
		System.out.println(member);
		bbsService.join(member);
		return "redirect:/list.bbs?pageNum=1";
	}
	
	@RequestMapping(value="/good.bbs")
	public ModelAndView goodUp(@RequestParam("articleNum") int articleNum){
		mav=new ModelAndView();
		bbsService.goodUp(articleNum);
		mav.setViewName("JSON");
		return mav;
	}
	
}	
