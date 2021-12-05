package com.delluna.hotels.common_notice;

import java.util.Date;

public class Qnares {
	private int no;
	private String response;
	private int qno;
	private String subject;
	private Date rdate;
	private String qstate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getResponse() {
		return response;
	}
	public void setReponse(String response) {
		this.response = response;
	}
	
	public String getQstate() {
		return qstate;
	}
	public void setQstate(String qstate) {
		this.qstate = qstate;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}
