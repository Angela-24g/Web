package com.delluna.hotels.manage_rooms;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.util.BusinessResult;

public interface IRoomService {

	// 클라이언트단 뷰이동
	BusinessResult goRoomsList();
	BusinessResult goRoomsSubTitle1();
	BusinessResult goRoomsSubTitle2();
	
	// 클라이언트단 - 예약관련
	BusinessResult getRezRoomType(ReservationAdm reservationAdm);
	BusinessResult getRoomDetails(RezAdmRoomType rezAdmRoomType);
	BusinessResult getLocation(RoomDetail roomDetail);
	BusinessResult getBedtype(RoomDetail roomDetail);
	BusinessResult getPrice(RoomDetail roomDetail,ReservationAdm reservationAdm);
}
