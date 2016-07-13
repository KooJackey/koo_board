package com.pknu.bbs.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.bbs.dao.BBSDao;
import com.pknu.bbs.dto.BBSDto;
import com.pknu.bbs.dto.FileDto;
import com.pknu.bbs.dto.MemberDto;
import com.pknu.bbs.dto.QueryDto;
import com.pknu.bbs.dto.UpdateDto;
import com.pknu.bbs.util.FileSaveHelper;

@Service
public class BBSServiceImpl implements BBSService {
	@Inject
	BBSDao bbsDao;
	@Resource
	Page page;
	@Inject
	FileSaveHelper fileSaveHelper;
	List<BBSDto> articleList;
	ModelAndView mav;
	String originFname;
	String storedFname;
	@Resource(name="saveDir")
	String saveDir;
	BBSDto article;
	QueryDto query;
	List<FileDto> fileList;
	
//	@Transactional(rollbackFor=ClassNotFoundException.class)
	@Transactional
	@Override
	public ModelAndView list(int pageNum){
		mav = new ModelAndView();
		int totalCount=0;		
		int pageSize=20;//한페이지에 보여줄 글의 갯수
	    int pageBlock=10;//한 블럭당 보여줄 페이지 갯수  	    
	   		
		totalCount=bbsDao.getArticleCount();			
		page.paging(pageNum,totalCount,pageSize, pageBlock);	
		
		String table="bbs2";
		query = new QueryDto();
		query.setEndRow(page.getEndRow());
		query.setStartRow(page.getStartRow());
		query.setTable(table);
		
		articleList=bbsDao.getArticles(query);
		
//		int commentcount=bbsDao.getCommentCount(articleNum);
		
		mav.addObject("totalCount",totalCount);
		mav.addObject("articleList",articleList);
		mav.addObject("pageNum", pageNum);
		mav.addObject("pagecode",page.getSb().toString());
		mav.addObject("table", table);
		mav.setViewName("list");
		return mav;
	}
	
	@Transactional
	@Override
	public ModelAndView study(int pageNum){
		mav = new ModelAndView();
		int totalCount=0;		
		int pageSize=20;//한페이지에 보여줄 글의 갯수
		int pageBlock=10;//한 블럭당 보여줄 페이지 갯수  	    
		
		totalCount=bbsDao.getArticleCount();			
		page.paging(pageNum,totalCount,pageSize, pageBlock);	
		
		String table="study";
		query = new QueryDto();
		query.setEndRow(page.getEndRow());
		query.setStartRow(page.getStartRow());
		query.setTable(table);
		
		articleList=bbsDao.getArticles(query);
		
		mav.addObject("totalCount",totalCount);
		mav.addObject("articleList",articleList);
		mav.addObject("pageNum", pageNum);
		mav.addObject("pagecode", page.getSb().toString());
		mav.addObject("table", table);
		mav.setViewName("list");
		return mav;
	}
	
	@Override 
	public int loginCheck(String id, String pass) {		
		int loginStatus =0;
		String dbPass=bbsDao.loginCheck(id);
								
		if(dbPass!=null){
			if(pass.equals(dbPass)){
				loginStatus=LoginStatus.OK;				
			}else{
				loginStatus=LoginStatus.PASS_FAIL;
			}			
		}else{
			loginStatus=LoginStatus.NOT_MEMBER;
		}		
			
		return loginStatus;
	}	

	@Override	//글쓰기
	@Transactional
	public void insertArticle(BBSDto article) {
		if(article.getFileNames()==null){
			bbsDao.insertArticle(article);
		}else{			
			int articleNum=bbsDao.getNextArticleNum(); // 파일이 있다면 미리 쿼리에서 시퀀스로 artN을 바로 받아온다 
			article.setArticleNum(articleNum);
			article.setFileStatus(1);
			bbsDao.insertArticle(article);
			commonFileUpload(articleNum, article.getFileNames());
			System.out.println("getFileNames가 null이 아니라서 여기 왔다. ");
		}				
	}	
	
	@Override	// 비동기 파일 업로드
	@Transactional
	public void asynFileUpload(MultipartHttpServletRequest mReq) {
		List<MultipartFile> mfile= mReq.getFiles("fname");
			System.out.println("mfile ------>"+mfile);
			int articleNum=bbsDao.getNextArticleNum(); // 파일이 있다면 미리 쿼리에서 시퀀스로 artN을 바로 받아온다 
//			commonFileUpload(mfile,articleNum);
	}	
	
	@Transactional
	@Override	// 글 읽기
	public ModelAndView getArticle(int articleNum, int fileStatus) {	
		mav = new ModelAndView();
		BBSDto article= null;		
		bbsDao.hitUp(articleNum);
//		int i=4/0;
		article=bbsDao.getArticle(articleNum);
		article.setCommentCount(bbsDao.getCommentCount(articleNum));
		if(fileStatus ==1){				
			fileList=bbsDao.getFiles(articleNum);
			mav.addObject("fileList", fileList);
			System.out.println(mav.toString());
		}		
		mav.addObject("userInfo", bbsDao.userProfile(article.getId()));
		mav.addObject("article", article);		
		mav.setViewName("bbs/content");
		return mav;
	}

	@Override
	public void deleteArticle(int articleNum) {
		bbsDao.deleteArticle(articleNum);
		this.delFile(articleNum);
	}

	@Override
	public void join(MemberDto member) {
		bbsDao.join(member);
	}


	@Override
	@Transactional
	public void reply(BBSDto article, MultipartHttpServletRequest mReq) {
		List<MultipartFile> mfile=mReq.getFiles("fname");
		if(mfile.get(0).isEmpty()){			
//			bbsDao.replyPos(article); 
			bbsDao.replyArticle(article);
		}else{			
			int articleNum=bbsDao.getNextArticleNum(); 
			System.out.println("그룹넘버 = "+article.getGroupId());
			article.setArticleNum(articleNum);
			article.setFileStatus(1);
			bbsDao.replyArticle(article);			
//			commonFileUpload(mfile,articleNum);	
		}	
	}
	
	@Override	// 수정하기 눌렸을 때 updateForm.jsp로 넘겨줌
	@Transactional
	public ModelAndView getUpdateArticle(int articleNum, int fileStatus) {
		mav = new ModelAndView();		
		article=bbsDao.getUpdateArticle(articleNum);
		mav.addObject("article", article);
			
		if(fileStatus==1){
			fileList=bbsDao.getFiles(articleNum);
			mav.addObject("fileList", fileList);
		}
		mav.setViewName("updateForm");
		return mav;
	}
	
	@Override
	@Transactional
	public ModelAndView updateArticle(MultipartHttpServletRequest mRequest,BBSDto article, UpdateDto updateDto) {
		mav= new ModelAndView();
		List<MultipartFile> mfile=mRequest.getFiles("fname"); 
//		새로운 파일이 업로드 없을경우
		if(mfile.get(0).isEmpty()){
//			기존에 업로드되어 있는 파일중 하나라도 삭제된경우
			if(updateDto.getFileNumList()!=null){						
				for(int fileNum : updateDto.getFileNumList()){
					updateSomeDelFile(fileNum);
				}			
				bbsDao.someDelFile(updateDto.getFileNumList());
				int fileListCount=
						bbsDao.getFileListCount(article.getArticleNum());
				if(fileListCount==0){
					article.setFileStatus(0);					
				}
			}
			bbsDao.updateArticle(article);
		}else{				
			if(updateDto.getFileNumList()!=null){				
				for(int fileNum : updateDto.getFileNumList()){
					updateSomeDelFile(fileNum);
				}			
				bbsDao.someDelFile(updateDto.getFileNumList());					
			}else{					
				article.setFileStatus(1);				
			}			
//			commonFileUpload(mfile,article.getArticleNum());
			bbsDao.updateArticle(article);			
		}
		mav.addObject("articleNum", article.getArticleNum());
		mav.addObject("fileStatus", article.getFileStatus());
		mav.setViewName("redirect:/content.bbs");		
		return mav;
	}
	
	@Override
	public FileSystemResource download(HttpServletResponse res, String storedFname) {
		res.setContentType("application/download");		
		
		String originFname = storedFname.substring(storedFname.indexOf("_")+1);
		try{
			originFname = URLEncoder.encode(originFname,"utf-8").replace("+","%20");
		}catch(Exception e){
			
		}
		
		res.setHeader("Content-Disposition", "attachment;" +" filename=\""+originFname+ "\";");
		FileSystemResource fsr= new FileSystemResource(saveDir+storedFname);
		return fsr;
	}
	

	public void delFile(int articleNum){
		List<String> delFileList=bbsDao.delFile(articleNum);
		if(!delFileList.isEmpty()){
			for(String storedFname : delFileList){
				File file = new File(saveDir+storedFname);
				if(file.exists()){
					file.delete();
				}
			}
		}
	}
	
	public void updateSomeDelFile(int fileNum){
		String storedFname=bbsDao.updateSomeDelFile(fileNum);
		if(!storedFname.isEmpty()){			
			File file = new File(saveDir+storedFname);
			if(file.exists()){
				file.delete();
			}			
		}
	}


	public void commonFileUpload(int articleNum, List<String> fileNames) {
		FileDto fileDto= null;
		List<FileDto> fileList = new ArrayList<FileDto>();
		
		for(String storedFname:fileNames){
			fileDto = new FileDto();					
			fileDto.setStoredFname(storedFname);
			fileDto.setArticleNum(articleNum); 	
			bbsDao.insertFile(fileDto);				
		}
	}
	
	@Override
	public void goodUp(int articleNum){
		bbsDao.good(articleNum);
	}
	
	@Override
	public void joinCheckId(String inputId, HttpServletResponse resp) {
		HashMap<String, String> hm = new HashMap<>();
		
		String DBId = bbsDao.selectId(inputId);
		
		if(DBId != null || inputId==""){
			hm.put("idUseStatus", "2");
		}else{
			hm.put("idUseStatus", "1");
		}
		
		JSONObject jb = new JSONObject(hm);
		
		PrintWriter pw;
		try {
			pw = resp.getWriter();
			pw.println(jb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 너님 정보 가져오기
	@Override
	public ModelAndView userProfile(String id) {
		mav= new ModelAndView();
		mav.addObject("userInfo", bbsDao.userProfile(id));
		return mav;
	}
	
	// 너님 정보 수정하기
	@Override
	public void userProfileUpdate(MemberDto userInfo) {
//		userInfo.setPicture();
		bbsDao.userProfileUpdate(userInfo);
	}
	
	
}
