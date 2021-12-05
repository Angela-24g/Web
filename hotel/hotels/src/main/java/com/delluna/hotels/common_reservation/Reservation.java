package com.delluna.hotels.common_reservation;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_rooms.Rooms;

public class Reservation {
	private int no;
    private String date_write;
    private String check_in;
    private String check_out;
    private int room_count;
    private int count_adult;
    private int count_elementary;
    private int count_child;
    private int count_baby;
    private int count_all;
    private String promotion_name;
    private long promotion_code;
//room table들과 연결되므로 필요없음.
//    private String type_product;
//    private String type_view;
//    private String type_location;
//    private String type_bed;
    private int breakfast_adult;
    private int breakfast_child;
    private int price_product;
    private int price_service;
    private int price_bed;
    private int price_options;
    private int price_member;
    private int price_point;
    private int price_total;
    private int price_result;
    private String name;
    private String email;
    private String tel;
    private String add_requests;
    private int views;
    private String state;
    
    private ReservationAdm rsv_adm_no;
    private Member writer;
    private Rooms rooms_no;
    
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getDate_write() {
		return date_write;
	}
	public void setDate_write(String date_write) {
		this.date_write = date_write;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public int getRoom_count() {
		return room_count;
	}
	public void setRoom_count(int room_count) {
		this.room_count = room_count;
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
	public String getPromotion_name() {
		return promotion_name;
	}
	public void setPromotion_name(String promotion_name) {
		this.promotion_name = promotion_name;
	}
	public long getPromotion_code() {
		return promotion_code;
	}
	public void setPromotion_code(long promotion_code) {
		this.promotion_code = promotion_code;
	}

	public int getBreakfast_adult() {
		return breakfast_adult;
	}
	public void setBreakfast_adult(int breakfast_adult) {
		this.breakfast_adult = breakfast_adult;
	}
	public int getBreakfast_child() {
		return breakfast_child;
	}
	public void setBreakfast_child(int breakfast_child) {
		this.breakfast_child = breakfast_child;
	}
	public int getPrice_product() {
		return price_product;
	}
	public void setPrice_product(int price_product) {
		this.price_product = price_product;
	}
	public int getPrice_service() {
		return price_service;
	}
	public void setPrice_service(int price_service) {
		this.price_service = price_service;
	}
	public int getPrice_options() {
		return price_options;
	}
	public void setPrice_options(int price_options) {
		this.price_options = price_options;
	}
	public int getPrice_bed() {
		return price_bed;
	}
	public void setPrice_bed(int price_bed) {
		this.price_bed = price_bed;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdd_requests() {
		return add_requests;
	}
	public void setAdd_requests(String add_requests) {
		this.add_requests = add_requests;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public ReservationAdm getRsv_adm_no() {
		return rsv_adm_no;
	}
	public void setRsv_adm_no(ReservationAdm rsv_adm_no) {
		this.rsv_adm_no = rsv_adm_no;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public Rooms getRooms_no() {
		return rooms_no;
	}
	public void setRooms_no(Rooms rooms_no) {
		this.rooms_no = rooms_no;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getPrice_total() {
		return price_total;
	}
	public void setPrice_total(int price_total) {
		this.price_total = price_total;
	}
	public int getPrice_member() {
		return price_member;
	}
	public void setPrice_member(int price_member) {
		this.price_member = price_member;
	}
	public int getPrice_point() {
		return price_point;
	}
	public void setPrice_point(int price_point) {
		this.price_point = price_point;
	}
	public int getPrice_result() {
		return price_result;
	}
	public void setPrice_result(int price_result) {
		this.price_result = price_result;
	}


}
