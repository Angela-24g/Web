package com.delluna.hotels.dataservice_rooms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomImage;
import com.delluna.hotels.common_rooms.Rooms;
import com.delluna.hotels.util.ConnectionUtil;

@Repository("roomDetailDAO")
public class RoomDetailDAO implements IRoomDetailDAO{
	@Autowired IRoomDetailMapper roomDetailMapper;
	@Autowired IRoomsDAO roomsDAO;
	@Autowired IRoomImageMapper roomImageMapper;
	
	//룸세부사항 저장하기(view,location,bedtype,price 등)
	@Override
	@Transactional
	public void save(RoomDetail roomDetail) {
		roomDetailMapper.save(roomDetail);
		//rooms 한번에 저장
		if(roomDetail.getRooms()!=null) {
			roomsDAO.saveRooms(roomDetail.getRooms());
		}
		//images 있다면 한번에 저장
		if(roomDetail.getRoomImages() != null) {
			roomImageMapper.saveImages(roomDetail.getRoomImages());
		}
	}
	
	/* 룸타입 예약 radio 준비(distinct) - ajax*/	
	@Override
	public List<RoomDetail> selectView(RoomDetail roomDetail) {
		return roomDetailMapper.selectView(roomDetail);
	}
	@Override
	public List<RoomDetail> selectLocation(RoomDetail roomDetail) {
		return roomDetailMapper.selectLocation(roomDetail);
	}
	@Override
	public List<RoomDetail> selectBedtype(RoomDetail roomDetail) {
		return roomDetailMapper.selectBedtype(roomDetail);
	}
	// roomType넘버 + view + location + bedtype 로 해당 RoomDetail 가져오기
	@Override
	public RoomDetail selectNoPrice(RoomDetail roomDetail) {
		//번호, 가격 가져와서 setting
		HashMap<String, Integer> NoAndPrice = roomDetailMapper.selectNoPrice(roomDetail);
		roomDetail.setRoomdetail_no(NoAndPrice.get("roomdetail_no"));
		roomDetail.setRoom_price(NoAndPrice.get("room_price"));
		return roomDetail;
	}
	
	/* 룸타입 객실 수 확인 : 처음 진입 시 - ajax */	
	//각 타입 가져오기 : RoomDetailDAO 의 firstDetails() 에서 사용
	@Override
	public List<RoomDetail> firstLocation(RoomDetail roomDetail) {
		return roomDetailMapper.firstLocation(roomDetail);
	}
	@Override
	public List<RoomDetail> firstBedtype(RoomDetail roomDetail) {
		return roomDetailMapper.firstBedtype(roomDetail);
	}

	@Override
	public int BedtypeForNo(RoomDetail roomDetail) {
		return roomDetailMapper.BedtypeForNo(roomDetail);
	}
		
	//룸세부사항 수정하기
	@Override
	public void updateDt(RoomDetail roomDetail) {
		roomDetailMapper.updateDt(roomDetail);
		for(Rooms room:roomDetail.getRooms()) {
			roomsDAO.updateRoom(room);
		}
		for(RoomImage roomImage:roomDetail.getRoomImages()) {
			roomImageMapper.updateRoomImage(roomImage);
		}
	}

	//페이징을 위한 메서드
	// Rooms 가 가진 RoomDetail 가져오기
	@Override
	public RoomDetail selectDt(int room_detail_no) {
		return roomDetailMapper.selectDt(room_detail_no);
	}
	//페이징을 위해 룸타입에 대한 룸디테일번호 가져오기
	@Override
	public List<RoomDetail> numbersByRmType(int room_type_no) {		
		return roomDetailMapper.numbersByRmType(room_type_no);
	}
	@Override
	public List<RoomDetail> numbersByOnlyView(String room_view) {
		return roomDetailMapper.numbersByOnlyView(room_view);
	}
	@Override
	public List<RoomDetail> numbersbyOnlyLocation(String room_location) {
		return roomDetailMapper.numbersbyOnlyLocation(room_location);
	}
	@Override
	public List<RoomDetail> numbersbyOnlyBedtype(String room_bedtype) {
		return roomDetailMapper.numbersbyOnlyBedtype(room_bedtype);
	}
	//roomType넘버 + view 로 thumbnail이름,사이즈 가져오기(distinct)
	@Override
	public List<RoomDetail> selectDtThumbnail(int room_type_no) {
		//HashMap<String,Object> : key = value --> {room_view:전망,thumbnail_name:이름, thumbnail_size:사이즈}
		return roomDetailMapper.selectDtThumbnail(room_type_no);
	}
}
