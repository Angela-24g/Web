package com.delluna.hotels.dataservice_rooms;

import java.util.List;

import com.delluna.hotels.common_rooms.Rooms;

public interface IRoomsDAO {
	void save(Rooms room);
	void saveRooms(List<Rooms> rooms);
	Rooms selectByNo(int no);
	boolean isInRoomsLast(int roomdetail_no,String state);
	Rooms selectByRoomDtNo(int no,String state);
	void updateState(int no,String state);
	void updateRoom(Rooms room);
	int getCount();
	int getCount(String kwd, String col);
	List<Rooms> selectRooms(int page, int perpage, String col, String kwd);
	public Rooms findByNo(int no);//예약에서 룸 찾기
}
