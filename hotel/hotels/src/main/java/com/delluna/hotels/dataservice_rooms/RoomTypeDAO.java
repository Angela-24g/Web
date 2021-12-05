package com.delluna.hotels.dataservice_rooms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.util.ConnectionUtil;

@Repository("roomTypeDAO")
public class RoomTypeDAO implements IRoomTypeDAO{
	@Autowired IRoomTypeMapper roomTypeMapper;
	
	/* 룸 타입 정보 등록 */
	@Override
	@Transactional
	public void save(RoomType roomType) {
		
		roomTypeMapper.save(roomType);
	}

	/* 룸타입 출력하기 - 예약 + 예약목록에서 (ex.디럭스) */
	@Override
	@Transactional
	public RoomType selecByNo(int no) {
		return roomTypeMapper.selecByNo(no);
	}

	/* 룸 사용자페이지 만들 때 사용 */
	@Override
	@Transactional
	public List<RoomType> selectAll() {
		return roomTypeMapper.selectAll();
	}

	/* 룸 타입 정보 수정 */
	@Override
	@Transactional
	public void updateRoomType(RoomType roomType) {
		//sql Timestamp 현재시간 넣어 생성
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());//yyyy-MM-dd hh:mm:ss.sss 밀리초까지나옴
		
		//업데이트시간 갱신
		roomType.setModify_date(timestamp);
		roomTypeMapper.updateRoomType(roomType);
	}

	@Override
	public boolean isInType(String type) {
		return roomTypeMapper.isInType(type);
	}
	
	@Override
	public List<Integer> selectAllNo() {
		return roomTypeMapper.selectAllNo();
	}
	
	@Override
	public int selectNo(String type) {
		return roomTypeMapper.selectNo(type);
	}

}
