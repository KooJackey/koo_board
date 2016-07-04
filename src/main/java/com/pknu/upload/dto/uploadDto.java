package com.pknu.upload.dto;

public class uploadDto {
	private int articleNum; 
	private String storedFname;
	private String fileLength;
	
	
	public int getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public String getFileLength() {
		return fileLength;
	}
	public void setFileLength(String fileLength) {
		this.fileLength = fileLength;
	}
	@Override
	public String toString() {
		return "uploadDto [articleNum=" + articleNum + ", storedFname=" + storedFname + ", fileLength=" + fileLength
				+ "]";
	}
	
	
}
