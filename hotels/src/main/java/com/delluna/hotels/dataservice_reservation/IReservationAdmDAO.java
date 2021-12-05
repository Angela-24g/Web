package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;

public interface IReservationAdmDAO {
	public int save(ReservationAdm reservationAdm);

	// public List<ReservationAdm> selectByPage(int page, int sizePerPage, int
	// totalSize);

	public ReservationAdm findByNoAddView(int no, boolean addView);

	public ReservationAdm findByNo(int no);

	public ReservationAdm findByPrev(int no);

	public ReservationAdm findByNext(int no);

	public List<ReservationAdm> selectAll();

	public List<ReservationAdm> selectList(int page, int perpage, String col, String kwd);

	int getCount();

	int getCount(String kwd, String col);

	public List<ReservationAdm> selectByDate(String check_in, String check_out);
}
