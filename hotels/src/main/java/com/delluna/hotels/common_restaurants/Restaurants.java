package com.delluna.hotels.common_restaurants;

import java.sql.Timestamp;

import com.delluna.hotels.common_member.Member;

public class Restaurants {
	private int no;
    private String restaurant_name;
    private String date_reserve;
    private String time_meal;
    private Timestamp date_write;
    private int count_adult;
    private int count_elementary;
    private int count_child;
    private int count_baby;
    private int count_all;
    private String id;
    private String name;
    private String tel;
    private String email;
    private String add_request;
    private String state;
    private Member writer;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public String getTime_meal() {
		return time_meal;
	}
	public void setTime_meal(String time_meal) {
		this.time_meal = time_meal;
	}
	public Timestamp getDate_write() {
		return date_write;
	}
	public void setDate_write(Timestamp date_write) {
		this.date_write = date_write;
	}
	public int getCount_adult() {
		return count_adult;
	}
	public void setCount_adult(int count_adult) {
		this.count_adult = count_adult;
	}
	public int getCount_elementary() {
		return count_elementary;
	}
	public void setCount_elementary(int count_elementary) {
		this.count_elementary = count_elementary;
	}
	public int getCount_child() {
		return count_child;
	}
	public void setCount_child(int count_child) {
		this.count_child = count_child;
	}
	public int getCount_baby() {
		return count_baby;
	}
	public void setCount_baby(int count_baby) {
		this.count_baby = count_baby;
	}
	public int getCount_all() {
		return count_all;
	}
	public void setCount_all(int count_all) {
		this.count_all = count_all;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public String getDate_reserve() {
		return date_reserve;
	}
	public void setDate_reserve(String date_reserve) {
		this.date_reserve = date_reserve;
	}
	
}
