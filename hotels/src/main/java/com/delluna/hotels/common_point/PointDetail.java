package com.delluna.hotels.common_point;

import java.sql.Date;

import com.delluna.hotels.common_member.Member;

public class PointDetail {

	private int no;
	private int member_no;
	private int state;
	private int amount;
	private PointEvent pointEventNo;
	private Date trans_date;
	private Date expire_date;
	
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public PointEvent getPointEventNo() {
		return pointEventNo;
	}
	public void setPointEventNo(PointEvent pointEventNo) {
		this.pointEventNo = pointEventNo;
	}
	public Date getTrans_date() {
		return trans_date;
	}
	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}
	
}
