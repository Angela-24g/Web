package com.delluna.hotels.common_takeout;

public class TakeoutProduct {

	private int no;
	private String name;
	private int price;
	private TakeoutAdm takeout_adm_no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public TakeoutAdm getTakeout_adm_no() {
		return takeout_adm_no;
	}
	public void setTakeout_adm_no(TakeoutAdm takeout_adm_no) {
		this.takeout_adm_no = takeout_adm_no;
	}
	
	
}
