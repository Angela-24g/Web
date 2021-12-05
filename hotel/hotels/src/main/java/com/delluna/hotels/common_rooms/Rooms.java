package com.delluna.hotels.common_rooms;

public class Rooms {
	private int no;
	private String state;
	private String room_number;
	private int room_detail_no;
	private RoomDetail roomDetail;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public RoomDetail getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(RoomDetail roomDetail) {
		this.roomDetail = roomDetail;
	}
	public int getRoom_detail_no() {
		return room_detail_no;
	}
	public void setRoom_detail_no(int room_detail_no) {
		this.room_detail_no = room_detail_no;
	}
	
}
