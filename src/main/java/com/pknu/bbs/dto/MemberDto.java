package com.pknu.bbs.dto;

public class MemberDto {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String birth;
	private String joinDate;
	private String memo;
	private String nickname;
	private String phonenumber;
	private String picture;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", joinDate=" + joinDate + ", memo=" + memo + ", nickname=" + nickname + ", phonenumber="
				+ phonenumber + ", picture=" + picture + "]";
	}
	
	
}
