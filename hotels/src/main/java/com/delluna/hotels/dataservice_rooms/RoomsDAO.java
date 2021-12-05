
package com.delluna.hotels.dataservice_rooms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.common_rooms.Rooms;
import com.delluna.hotels.util.ConnectionUtil;

@Repository("roomsDAO")
public class RoomsDAO implements IRoomsDAO{
	@Autowired IRoomsMapper roomsMapper;
	@Autowired IRoomDetailDAO roomDetailDAO;
	@Autowired IRoomTypeDAO roomTypeDAO;
	
	@Override
	public void save(Rooms room) {
		roomsMapper.save(room);
	}

	@Override
	public void saveRooms(List<Rooms> rooms) {
		roomsMapper.saveRooms(rooms);
	}

	@Override
	public Rooms selectByNo(int no) {
		return roomsMapper.selectByNo(no);
	}

	@Override
	public boolean isInRoomsLast(int roomdetail_no, String state) {
		return roomsMapper.isInRoomsLast(roomdetail_no, state);
	}

	@Override
	public Rooms selectByRoomDtNo(int no, String state) {
		return roomsMapper.selectByRoomDtNo(no, state);
	}

	@Override
	public void updateState(int no, String state) {
		roomsMapper.updateState(no, state);
	}

	@Override
	public void updateRoom(Rooms room) {
		roomsMapper.updateRoom(room);
	}
	
	//페이징을 위한 select
	@Override
	public List<Rooms> selectRooms(int page, int perpage, String col, String kwd) {
		int startPage = (page-1)*perpage;
		List<Rooms> rooms = null;
		
		if(col.equals("type")) {
			int room_type_no = roomTypeDAO.selectNo(kwd);
			if(room_type_no==0) {
				return null;
			}
			List<RoomDetail> roomDetails = roomDetailDAO.numbersByRmType(room_type_no);
			rooms = roomsMapper.selectLimit(roomDetails, startPage, perpage);
		}else if(col.equals("room_view")) {
			List<RoomDetail> roomDetails = roomDetailDAO.numbersByOnlyView(kwd);
			if(roomDetails.size()==0) {
				return null;
			}
			rooms = roomsMapper.selectLimit(roomDetails, startPage, perpage);
		}else if(col.equals("room_location")) {
			List<RoomDetail> roomDetails = roomDetailDAO.numbersbyOnlyLocation(kwd);
			if(roomDetails.size()==0) {
				return null;
			}
			rooms = roomsMapper.selectLimit(roomDetails, startPage, perpage);
			
		}else if(col.equals("room_bedtype")) {
			List<RoomDetail> roomDetails = roomDetailDAO.numbersbyOnlyBedtype(kwd);
			if(roomDetails.size()==0) {
				return null;
			}
			rooms = roomsMapper.selectLimit(roomDetails, startPage, perpage);
			
		}else if(col.equals("state")) {
			rooms = roomsMapper.selectByState(kwd, startPage, perpage);
			if(rooms.size()==0) {
				return null;
			}
			
		}else{
			rooms = roomsMapper.selectRooms(startPage, perpage);
		}
		
		for(Rooms room:rooms) {
			int room_detail_no = room.getRoom_detail_no();
			RoomDetail roomDetail = roomDetailDAO.selectDt(room_detail_no);
			
			int room_type_no = roomDetail.getRoom_type_no();
			RoomType roomType = roomTypeDAO.selecByNo(room_type_no);
			
			roomDetail.setRoomType(roomType);
			room.setRoomDetail(roomDetail);
		}
		
		return rooms;
	}

	@Override
	public int getCount() {
		return roomsMapper.getCount();
	}

	@Override
	public int getCount(String kwd, String col) {
		StringBuffer totalSQL = new StringBuffer();
		totalSQL.append("select count(*) as count from rooms where ");
		List<RoomDetail> roomDetails = new ArrayList<RoomDetail>();
		int total = 0;
		
		try {
				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement psmt = null;
				ResultSet rs = null;
				if(col.equals("type")) {
					int room_type_no = roomTypeDAO.selectNo(kwd);
					roomDetails = roomDetailDAO.numbersByRmType(room_type_no);
					totalSQL.append("room_detail_no in (");
					
				}else if(col.equals("room_view")) {
					System.out.println(col);
					roomDetails = roomDetailDAO.numbersByOnlyView(kwd);
					totalSQL.append("room_detail_no in (");
					
				}else if(col.equals("room_location")) {
					roomDetails = roomDetailDAO.numbersbyOnlyLocation(kwd);
					totalSQL.append("room_detail_no in (");
					
				}else if(col.equals("room_bedtype")) {
					roomDetails = roomDetailDAO.numbersbyOnlyBedtype(kwd);
					totalSQL.append("room_detail_no in (");
					
				}else if(col.equals("state")) {
					totalSQL.append("state='"+kwd+"'");
					String sql = totalSQL.toString();
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
					rs.next();
					
					total = rs.getInt("count");
					rs.close();
					psmt.close();
					conn.close();
					
					return total;
				}
				for(int i = 0; i < roomDetails.size();i++) {
					RoomDetail roomDetail = new RoomDetail();
					roomDetail = roomDetails.get(i);
					totalSQL.append(roomDetail.getRoomdetail_no()+",");
					
					if(i==roomDetails.size()-1) {
						totalSQL.append(roomDetail.getRoomdetail_no());
					}
				}
				totalSQL.append(")");
				String sql = totalSQL.toString();
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
				rs.close();
				psmt.close();
				conn.close();
			
			
				}catch(Exception e) { e.printStackTrace(); }
		  return total;		
			
	}

	//예약에서 룸 찾기
	@Override
	public Rooms findByNo(int no) {
		return roomsMapper.findByNo(no);
	}

	
}
