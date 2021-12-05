package com.delluna.hotels.common_reservation;

public class ReservationAttach {
	private int no;
    private String name;
    private long size;
    private ReservationAdm rsv_adm;
	
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
	public ReservationAdm getRsv_adm() {
		return rsv_adm;
	}
	public void setRsv_adm(ReservationAdm rsv_adm) {
		this.rsv_adm = rsv_adm;
	}
}
