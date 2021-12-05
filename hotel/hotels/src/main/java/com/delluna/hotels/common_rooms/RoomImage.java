package com.delluna.hotels.common_rooms;

public class RoomImage {
	private int no;
	private String name;
	private long size;
	private RoomDetail roomDetail;
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
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public RoomDetail getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(RoomDetail roomDetail) {
		this.roomDetail = roomDetail;
	}
}
