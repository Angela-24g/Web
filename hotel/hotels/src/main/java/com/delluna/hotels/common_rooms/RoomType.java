package com.delluna.hotels.common_rooms;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class RoomType {
	private int no;
	private String type;
	private int adult_cnt;
	private String title;
	private String info;
	private Timestamp wdate;
	private Timestamp modify_date;
	private List<RoomDetail> roomDetails;
		
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type.replace("\r\n", "<br>");
	}
	public int getAdult_cnt() {
		return adult_cnt;
	}
	public void setAdult_cnt(int adult_cnt) {
		this.adult_cnt = adult_cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title.replace("\r\n", "<br>");
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info.replace("\r\n", "<br>");
	}
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	public Timestamp getModify_date() {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		modify_date = Timestamp.valueOf(sdf.format(timestamp));
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	public List<RoomDetail> getRoomDetails() {
		return roomDetails;
	}
	public void setRoomDetails(List<RoomDetail> roomDetails) {
		this.roomDetails = roomDetails;
	}
}
