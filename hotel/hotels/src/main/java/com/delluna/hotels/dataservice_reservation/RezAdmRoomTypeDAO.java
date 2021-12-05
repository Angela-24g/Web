package com.delluna.hotels.dataservice_reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.util.ConnectionUtil;

@Repository
public class RezAdmRoomTypeDAO implements IRezAdmRoomTypeDAO{
	@Autowired IRezAdmRoomTypeMapper RaRTypeMapper;
	
	@Override
	public void save(RezAdmRoomType RaRType) {
		RaRTypeMapper.save(RaRType);
	}
	
	@Override
	public List<RezAdmRoomType> selectAll() {
		return RaRTypeMapper.selectAll();
	}
	
	@Override
	public List<RoomType> selectTypeAll() {
		return RaRTypeMapper.selectTypeAll();
	}
	
	@Override
	public RezAdmRoomType findByTypeNo(int no) {
		return RaRTypeMapper.findByTypeNo(no);
	}
	
	@Override
	public List<RezAdmRoomType> selectByRezAdmNo(int no) {//reservation_adm_no
		Connection connection = null;
		PreparedStatement ps = null;
		List<RezAdmRoomType> listAdmRoomType = null;
		try {
			connection = ConnectionUtil.getConnection();
			ps = connection.prepareStatement("select * from rez_adm_room_type where rez_adm=?");
			ps.setInt(1, no);
			
			ResultSet rs = ps.executeQuery();
			listAdmRoomType = new ArrayList<RezAdmRoomType>();
			while(rs.next()) {
				RezAdmRoomType rezAdmRoomType = new RezAdmRoomType();
				
				//reservation_adm 에 번호 넣기
				ReservationAdm rezAdm = new ReservationAdm();
				rezAdm.setRezAdm_no(no);
				
				//room_type 에 번호넣기
				RoomType roomType = new RoomType();
				roomType.setNo(rs.getInt("room_type"));
				//reservation_adm, room_type 넣기
				rezAdmRoomType.setRezAdm(rezAdm);
				rezAdmRoomType.setRoomType(roomType);
				
				rezAdmRoomType.setTitle(rs.getString("title"));
				rezAdmRoomType.setBenefit(rs.getString("benefit"));
				
				listAdmRoomType.add(rezAdmRoomType);
			}
			
			rs.close();
			ps.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return listAdmRoomType;
	}

	

	

	

}
