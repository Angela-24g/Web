package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomType;

@Mapper
public interface IRezAdmRoomTypeMapper {
	
	@Insert("insert into rez_adm_room_type(rez_adm,room_type,title,benefit) values(#{rezAdm.rezAdm_no},#{roomType.no},#{title},#{benefit})")
	public void save(RezAdmRoomType RaRType);

	@Select("select * from room_type")
	public List<RoomType> selectTypeAll();
	
	@Select("select * from rez_adm_room_type")
	public List<RezAdmRoomType> selectAll();
	
	List<RezAdmRoomType> selectByRezAdmNo(int no);
	
	@Select("select * from rez_adm_room_type WHERE rez_adm_room_no = #{no}")
	public RezAdmRoomType findByTypeNo(@Param("no")int no);
	
}
