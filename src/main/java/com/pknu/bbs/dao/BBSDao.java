package com.pknu.bbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pknu.bbs.dto.BBSDto;
import com.pknu.bbs.dto.FileDto;
import com.pknu.bbs.dto.MemberDto;
import com.pknu.bbs.dto.QueryDto;

public interface BBSDao {
	public int getArticleCount();
//	public List<BBSDto> getArticles(HashMap<String, Object> hm);
	public List<BBSDto> getArticles(QueryDto query);
	public String loginCheck(String id);
	public void insertArticle(BBSDto article);
	public void insertFile(FileDto article);
	public BBSDto getArticle(int articleNum);
	public List<FileDto> getFiles(int articleNum);
	public void join(MemberDto member);
	public void hitUp(int articleNum);
	public void good(int articleNum);
	
	public void deleteArticle(int articleNum);
	public int getNextArticleNum();
	public void replyPos(BBSDto article);	// upPos
	public void replyArticle(BBSDto article);
//	// 글수정
	public void updateArticle(BBSDto article);
	public BBSDto getUpdateArticle(int articleNum);
	public BBSDto getUpdateArticleFile(int articleNum);

	public int getFileListCount(int articleNum);
	public void someDelFile(ArrayList<Integer> fileNumList);
	public void updateAllDelFile(int articleNum);
	public String updateSomeDelFile(int fileNum);
	public List<String> delFile(int articleNum);
	public int getCommentCount(int articleNum);
	
	//-------메시지------------------
//	public List<BBSDto> requestID();
//	public void insertMsg(JmsVO jv);		// 메시지 보낸거 DB에 저장
//	public List<JmsVO> getSubMsg(String id);	// 받은 메시지 읽어옴
//	public List<JmsVO> getPubMsg(String id);	// 보낸 메시지 읽어옴
	
	
	String selectId(String inputId);
	// 너님 정보
	public MemberDto userProfile(String id);
	public void userProfileUpdate(MemberDto userInfo);
}
