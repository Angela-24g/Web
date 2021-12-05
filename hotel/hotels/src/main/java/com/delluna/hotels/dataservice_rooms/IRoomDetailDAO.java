package com.delluna.hotels.dataservice_rooms;

import java.util.HashMap;
import java.util.List;

import com.delluna.hotels.common_rooms.RoomDetail;

public interface IRoomDetailDAO {
	//룸세부사항 저장하기(view,location,bedtype,price 등)
	void save(RoomDetail roomDetail);
	
/* 룸타입 예약 radio 준비 */
	
	//각 타입 가져오기
	List<RoomDetail> selectView(RoomDetail roomDetail);
	List<RoomDetail> selectLocation(RoomDetail roomDetail);
	List<RoomDetail> selectBedtype(RoomDetail roomDetail);
	
	List<RoomDetail> firstLocation(RoomDetail roomDetail);
	List<RoomDetail> firstBedtype(RoomDetail roomDetail);
	int BedtypeForNo(RoomDetail roomDetail);
	//마지막 선택후 가격,번호 가져오기
	RoomDetail selectNoPrice(RoomDetail roomDetail);

	//룸세부사항 수정하기
	void updateDt(RoomDetail roomDetail);
	
	/*	adm-rooms-list 페이징  */
	//Rooms 가 가진 RoomDetail 가져오기
	RoomDetail selectDt(int room_detail_no);
	
	//페이징을 위해 룸타입에 관한 룸디테일번호 가져오기
	List<RoomDetail> numbersByRmType(int room_type_no);
	//디테일 필터
	List<RoomDetail> numbersByOnlyView(String room_view);
	List<RoomDetail> numbersbyOnlyLocation(String room_location);
	List<RoomDetail> numbersbyOnlyBedtype(String room_bedtype);	
	
	// roomType넘버 + view 로 thumbnail 가져오기(distinct)
	List<RoomDetail> selectDtThumbnail(int room_type_no);
}
