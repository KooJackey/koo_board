package com.pknu.msg.vo;

import java.io.Serializable;

public class JmsVO implements Serializable {
	private static final long serialVersionUID = 2057288248508986351L;
	private String pubID;
	private String subID;
	private String msg;
	private int readStatus;
	private int msgNo;
	private String msgDate;
	
	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
	public String getPubID() {
		return pubID;
	}
	public void setPubID(String pubID) {
		this.pubID = pubID;
	}
	public String getSubID() {
		return subID;
	}
	public void setSubID(String subID) {
		this.subID = subID;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	@Override
	public String toString() {
		return "JmsVO [pubID=" + pubID + ", subID=" + subID + ", msg=" + msg + ", readStatus=" + readStatus + ", msgNo="
				+ msgNo + ", msgDate=" + msgDate + "]";
	}

}
