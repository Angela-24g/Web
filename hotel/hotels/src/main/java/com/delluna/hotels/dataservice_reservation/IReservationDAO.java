package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.ReservationJoin;

public interface IReservationDAO {
	public void save(Reservation reservation);

	public void editRsv(Reservation rsvUpdate);

	public void delete(int no);

	public void updateState(String state, int no);

	// public List<Reservation> selectByPage(int page, int sizePerPage, RefInteger
	// totalSize);

	public Reservation findByNo(int no);

	public Reservation findByRsvNo(int no);

	public Reservation findByRRRNo(int no);

	public Reservation findByPrev(int no);

	public Reservation findByNext(int no);

	public List<Reservation> selectAll();
	
	public List<Reservation> selectList(int page, int perpage, String col, String kwd);

	int getCount();

	int getCount(String kwd, String col);

	public List<Reservation> selectAllByMemberNo(int member_no);

	public int findByNoRoom(int no);

	public ReservationAdm findByNoAdm(ReservationAdm rsvAdmNo);

	public ReservationJoin selectRsvJoinNo(int no);
	
}
