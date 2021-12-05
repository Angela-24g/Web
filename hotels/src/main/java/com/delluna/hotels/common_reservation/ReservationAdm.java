package com.delluna.hotels.common_reservation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReservationAdm {
	private int rezAdm_no;
	private String title;
	private String title_s;
	private String date_start;
	private String date_end;
	private byte thum;
	private String content;
	private String benefits;
	private int views;
	private double pkg_rate;
	private Date rsv_write;
	public List<MultipartFile> rsv_atc_file;
	public List<ReservationAttach> rsv_attach;

	public int getRezAdm_no() {
		return rezAdm_no;
	}

	public void setRezAdm_no(int rezAdm_no) {
		this.rezAdm_no = rezAdm_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle_s() {
		return title_s;
	}

	public void setTitle_s(String title_s) {
		this.title_s = title_s;
	}

	public String getDate_start() {
		return date_start;
	}

	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}

	public String getDate_end() {
		return date_end;
	}

	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}

	public byte getThum() {
		return thum;
	}

	public void setThum(byte thum) {
		this.thum = thum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}

	/*
	 * public int getCount_adult() { return count_adult; } public void
	 * setCount_adult(int count_adult) { this.count_adult = count_adult; } public
	 * int getCount_elementary() { return count_elementary; } public void
	 * setCount_elementary(int count_elementary) { this.count_elementary =
	 * count_elementary; } public int getCount_child() { return count_child; }
	 * public void setCount_child(int count_child) { this.count_child = count_child;
	 * } public int getCount_baby() { return count_baby; } public void
	 * setCount_baby(int count_baby) { this.count_baby = count_baby; } public int
	 * getCount_all() { return count_all; } public void setCount_all(int count_all)
	 * { this.count_all = count_all; }
	 */
	public long getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getrsv_write() {
		return rsv_write;
	}

	public void setRsv_write(Date rsv_write) {
		this.rsv_write = rsv_write;
	}

//	public Member getWriter() {
//		return writer;
//	}
//	public void setWriter(Member writer) {
//		this.writer = writer;
//	}

	
	public List<MultipartFile> getRsv_atc_file() {
		return rsv_atc_file;
	}

	public void setRsv_atc_file(List<MultipartFile> rsv_atc_file) {
		this.rsv_atc_file = rsv_atc_file;
	}

	public List<ReservationAttach> getRsv_attach() {
		if (rsv_atc_file != null && rsv_attach == null) {
			this.rsv_attach = new ArrayList<ReservationAttach>();
			for (MultipartFile multipartFile : rsv_atc_file) {
				ReservationAttach rsv_atc = new ReservationAttach();
				rsv_atc.setName(multipartFile.getOriginalFilename());
				rsv_atc.setSize(multipartFile.getSize());
				rsv_atc.setRsv_adm(this);
				rsv_attach.add(rsv_atc);
			}
		}
		return rsv_attach;
	}

	public void setRsv_attach(List<ReservationAttach> rsv_attach) {
		for (ReservationAttach rsv_atc : rsv_attach) {
			rsv_atc.setRsv_adm(this);
		}
		this.rsv_attach = rsv_attach;
	}

	public double getPkg_rate() {
		return pkg_rate;
	}

	public void setPkg_rate(double pkg_rate) {
		this.pkg_rate = pkg_rate;
	}

	
}
