package com.delluna.hotels.common_reservation;

import com.delluna.hotels.common_rooms.RoomType;

public class RezAdmRoomType {

	private int rez_adm_room_no;
	private ReservationAdm rezAdm;
	private RoomType roomType;
	private String title;
	private String benefit;
	
	
	public int getRez_adm_room_no() {
		return rez_adm_room_no;
	}
	public void setRez_adm_room_no(int rez_adm_room_no) {
		this.rez_adm_room_no = rez_adm_room_no;
	}
	public ReservationAdm getRezAdm() {
		return rezAdm;
	}
	public void setRezAdm(ReservationAdm rezAdm) {
		this.rezAdm = rezAdm;
	}
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBenefit() {
		return benefit;
	}
	public void setBenefit(String benefit) {
		this.benefit = benefit.replace("\r\n", "<br>");
	}
	
}
