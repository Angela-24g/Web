package com.delluna.hotels.common_takeout;

import java.sql.Date;

import com.delluna.hotels.common_member.Member;

public class Takeout {

	private int no;
	private int count ;
	private Date date_write ;
	private String date_pick ;
	private String product ;
	private int price ;
	private String add_request ;
	private String state ;
	
	//비회원전용
	private String name ;
	private String tel ;
	private String email ;
	
	//외래키
	private Member writer ;
	private TakeoutAdm takeout_adm_no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getDate_write() {
		return date_write;
	}
	public void setDate_write(Date date_write) {
		this.date_write = date_write;
	}
	public String getDate_pick() {
		return date_pick;
	}
	public void setDate_pick(String date_pick) {
		this.date_pick = date_pick;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAdd_request() {
		return add_request;
	}
	public void setAdd_request(String add_request) {
		this.add_request = add_request;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public TakeoutAdm getTakeout_adm_no() {
		return takeout_adm_no;
	}
	public void setTakeout_adm_no(TakeoutAdm takeout_adm_no) {
		this.takeout_adm_no = takeout_adm_no;
	}
	
	
}
