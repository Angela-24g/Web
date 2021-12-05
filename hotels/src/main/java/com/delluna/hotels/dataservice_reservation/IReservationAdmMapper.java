package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.delluna.hotels.common_reservation.ReservationAdm;

@Mapper
public interface IReservationAdmMapper {
	//@Delete("DELETE FROM reservation_adm WHERE no=#{no}")
	//public void delete(int no);
	
	@Select("select * from reservation_adm where rezAdm_no=#{no}")
	public ReservationAdm findByNo(@Param("no")int no);
	
}
