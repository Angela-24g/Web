package com.delluna.hotels.common_reservation;

import java.util.Date;

public class ReservationPromotion {
	private int no;
	private String name;
	private int code;
	private Date date_created;
	private Date date_use;
	private Date date_expriation;
	//private Member rsv_member;
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
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	public Date getDate_use() {
		return date_use;
	}
	public void setDate_use(Date date_use) {
		this.date_use = date_use;
	}
	public Date getDate_expriation() {
		return date_expriation;
	}
	public void setDate_expriation(Date date_expriation) {
		this.date_expriation = date_expriation;
	}
	public ReservationAdm getRsv_adm() {
		return rsv_adm;
	}
	public void setRsv_adm(ReservationAdm rsv_adm) {
		this.rsv_adm = rsv_adm;
	}
}
