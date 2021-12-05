package com.delluna.hotels.common_notice;

import java.sql.Date;

import com.delluna.hotels.common_member.Member;

public class Qna {
	private int no;
	private String question;
	private String title;
	private String contents;
	private Date wdate;
	private Member writer;
	private String qsts;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public String getQsts() {
		return qsts;
	}
	public void setQsts(String qsts) {
		this.qsts = qsts;
	}
	

	
}
