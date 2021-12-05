package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomType;

public interface IRezAdmRoomTypeDAO {

	public void save(RezAdmRoomType RaRType);

	public List<RoomType> selectTypeAll();

	public List<RezAdmRoomType> selectAll();

	public List<RezAdmRoomType> selectByRezAdmNo(int no);
	
	public RezAdmRoomType findByTypeNo(int no);
}
