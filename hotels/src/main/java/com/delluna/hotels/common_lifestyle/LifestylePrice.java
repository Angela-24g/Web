package com.delluna.hotels.common_lifestyle;

public class LifestylePrice {
	int no;
	String price_type;
	String price;
	Lifestyle lifestyle;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Lifestyle getLifestyle() {
		return lifestyle;
	}
	public void setLifestyle(Lifestyle lifestyle) {
		this.lifestyle = lifestyle;
	}
}
