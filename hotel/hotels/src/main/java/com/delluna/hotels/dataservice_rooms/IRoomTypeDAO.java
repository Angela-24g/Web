package com.delluna.hotels.dataservice_rooms;

import java.util.List;

import com.delluna.hotels.common_rooms.RoomType;

public interface IRoomTypeDAO {
	/* 룸 타입 정보 등록 */
	void save(RoomType roomType);
	
	/* 룸타입 출력하기 - 예약 + 예약목록에서 (ex.디럭스) */
	RoomType selecByNo(int no);

	/* 룸 사용자페이지 만들 때 사용 */
	List<RoomType> selectAll();
	
	/* 룸타입 존재여부 파악 - 중복저장방지 */
	boolean isInType(String type);
	
	/* 룸타입 존재여부 파악 - 존재하는룸:번호만갖고오기 */
	int selectNo(String type);
	
	/* 관리자페이지 룸관리 출력 */	
	List<Integer> selectAllNo();
	
	/* 룸 타입 정보 수정 */
	void updateRoomType(RoomType roomType);
}
