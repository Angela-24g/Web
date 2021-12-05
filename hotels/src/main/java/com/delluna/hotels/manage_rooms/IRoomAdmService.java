package com.delluna.hotels.manage_rooms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.util.BusinessResult;

public interface IRoomAdmService {
	public BusinessResult gotoAdmMainList();
	public BusinessResult gotoAdmRoomsList(int page,String kwd,String col);
	public BusinessResult gotoAdmRoomWrite();
	public BusinessResult gotoAdmRoomTypeWrite();
	public BusinessResult registerRoomType(RoomType roomType,RoomDetail roomDetail,HttpServletRequest request);
	public BusinessResult registerRooms(RoomDetail roomDetail);
	public BusinessResult getRoomDetailsAdm(RoomDetail roomDetail);
}
