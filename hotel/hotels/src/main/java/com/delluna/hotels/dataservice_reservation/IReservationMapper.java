package com.delluna.hotels.dataservice_reservation;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;

@Mapper
public interface IReservationMapper {
	@Insert("insert into reservation(check_in,check_out,room_count,count_adult,count_elementary,count_child,count_baby,count_all,price_product,price_service,price_options,price_member,price_point,price_bed,price_total,price_result,name,email,tel,add_requests,rsv_adm_no,writer,rooms_no) "
			+ "values(#{check_in},#{check_out},#{room_count},#{count_adult},#{count_elementary},#{count_child},#{count_baby},#{count_all},#{price_product},#{price_service},#{price_options},#{price_member},#{price_point},#{price_bed},#{price_total},#{price_result},#{name},#{email},#{tel},#{add_requests},#{rsv_adm_no.rezAdm_no},#{writer.no},#{rooms_no.no})")
	@SelectKey(statement = "select last_insert_id()", keyProperty = "no", before = false, resultType = int.class)
	public void save(Reservation reservation);

	@Update("UPDATE reservation SET name=#{name}, email=#{email}, tel=#{tel}, add_requests=#{add_requests} WHERE no=#{no}")
	public void editRsv(Reservation rsvUpdate);
	
	@Delete("DELETE FROM reservation WHERE no=#{no}")
	public void delete(int no);
	
	@Update("UPDATE reservation SET state=#{state} WHERE no=#{no}")
	public void updateState(@Param("state") String state, @Param("no") int no);

	// public List<Reservation> selectByPage(int page, int sizePerPage, RefInteger
	// totalSize);

	@Select("SELECT * FROM reservation WHERE no=#{no}")
	public Reservation findByNo(int no);
	
	@Select("SELECT * FROM reservation WHERE no=#{no}")
	public Reservation findByRsvNo(int no);

	@Select("SELECT * FROM reservation WHERE no < #{no} ORDER BY no DESC LIMIT 1")
	public Reservation findByPrev(int no);

	@Select("SELECT * FROM reservation WHERE no > #{no} ORDER BY no LIMIT 1")
	public Reservation findByNext(int no);

	@Select("SELECT * FROM reservation ORDER BY no DESC")
	public List<Reservation> selectAll();
	
	//select reservation, reservation_adm, rooms
	//@Select("SELECT * FROM reservation_adm ra " + 
	//		"RIGHT JOIN reservation r " + 
	//		"ON r.rsv_adm_no = ra.rezAdm_no " + 
	//		"JOIN rooms rm ON r.rooms_no = rm.no " +
	//		"WHERE r.no = #{no} " +
	//		"ORDER BY r.no desc;")// #{no} #{rsv_adm_no.rezAdm_no} #{rooms_no.no}
	//public ReservationJoin selectRsvJoinNo(int no);
	
	@Select("select * from reservation where no=#{no}")
	@Results(value = {
	            @Result(property="check_in", column="check_in"),
	            @Result(property="check_out", column="check_out"),
	            @Result(property="room_count", column="room_count"),
	            @Result(property="count_adult", column="count_adult"),
	            @Result(property="count_elementary", column="count_elementary"),
	            @Result(property="count_child", column="count_child"),
	            @Result(property="count_baby", column="count_baby"),
	            @Result(property="count_child", column="count_child"),
	            @Result(property="count_all", column="count_all"),
	            @Result(property="price_product", column="price_product"),
	            @Result(property="price_service", column="price_service"),
	            @Result(property="price_options", column="price_options"),
	            @Result(property="price_member", column="price_member"),
	            @Result(property="price_point", column="price_point"),
	            @Result(property="price_bed", column="price_bed"),
	            @Result(property="price_total", column="price_total"),
	            @Result(property="name", column="name"),
	            @Result(property="email", column="email"),
	            @Result(property="tel", column="tel"),
	            @Result(property="add_requests", column="add_requests"),
	            @Result(property="rsv_adm_no", column="rsv_adm_no", one=@One(select="com.delluna.hotels.dataservice_reservation.IReservationAdmMapper.findByNo")),
	            @Result(property="rooms_no", column="rooms_no", one=@One(select="com.delluna.hotels.dataservice_rooms.IRoomsMapper.findByNo")),
	            @Result(property="writer", column="writer", one=@One(select="com.delluna.hotels.dataservice_member.IMemberMapper.findByNo"))  })
	public Reservation findByRRRNo(int no);
	
	@Select("SELECT * FROM reservation WHERE writer = #{member_no} ORDER BY no DESC")
	public List<Reservation> selectAllByMemberNo(int member_no);

	@Select("SELECT * FROM rooms WHERE no = #{no}")
	public int findByNoRoom(int no);

	@Select("SELECT * FROM reservation_adm WHERE rezAdm_no = #{no}")
	public ReservationAdm findByNoAdm(ReservationAdm roomNo);
}
