package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import com.delluna.hotels.common_reservation.ReservationAttach;

public interface IReservationAttachDAO {
	void save(ReservationAttach rsvAtc);
	List<ReservationAttach> selectByRsvAdmNo(int rsvAtcNo);
	//ReservationAttach findByNo(int rsvAtcNo);
}
