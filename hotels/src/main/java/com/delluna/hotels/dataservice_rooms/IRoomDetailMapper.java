package com.delluna.hotels.dataservice_rooms;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_rooms.RoomDetail;

@Mapper
public interface IRoomDetailMapper {
	
	//룸세부사항 저장하기(view,location,bedtype,price 등)
	@Insert("insert into room_detail(room_view,room_location,room_bedtype,room_price,room_thumb_name,room_thumb_size,room_type_no) "
			+ "values(#{room_view},#{room_location},#{room_bedtype},#{room_price},#{room_thumb_name},#{room_thumb_size},#{roomType.no})")
	@SelectKey(statement="select last_insert_id()", keyProperty="roomdetail_no", before=false, resultType=int.class)
	void save(RoomDetail roomDetail);
	
/* 룸타입 예약 radio 준비(distinct) - ajax*/	
	@Select("select distinct room_view from room_detail where room_type_no=#{roomType.no} order by room_view")
	List<RoomDetail> selectView(RoomDetail roomDetail);

	@Select("select distinct room_location from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view} order by room_location")
	List<RoomDetail> selectLocation(RoomDetail roomDetail);
	
	@Select("select distinct room_bedtype from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view} and room_location=#{room_location} order by room_bedtype")
	List<RoomDetail> selectBedtype(RoomDetail roomDetail);
	
	//최종 -  디테일 넘버, 가격
	@Select("select roomdetail_no,room_price from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view} and room_location=#{room_location} and room_bedtype=#{room_bedtype}")
	HashMap<String,Integer> selectNoPrice(RoomDetail roomDetail);

/* 룸타입 객실 수 확인 : 처음 진입 시 - ajax */	
	//각 타입 가져오기 : RoomDetailDAO 의 firstDetails() 에서 사용
	@Select("select distinct room_location from room_detail where room_type_no=#{roomType.no} order by room_location")
	List<RoomDetail> firstLocation(RoomDetail roomDetail);
	
	@Select("select distinct room_bedtype from room_detail where room_type_no=#{roomType.no} order by room_bedtype")
	List<RoomDetail> firstBedtype(RoomDetail roomDetail);
	
//	//각 타입을 넣어 no 값 가져오기
//	@Select("select roomdetail_no from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view}")
//	List<RoomDetail> NobyView(RoomDetail roomDetail);
//
//	@Select("select roomdetail_no from room_detail where room_type_no=#{roomType.no} and room_location=#{room_location}")
//	List<RoomDetail> NobyLocation(RoomDetail roomDetail);
//
//	@Select("select roomdetail_no from room_detail where room_type_no=#{roomType.no} and room_bedtype=#{room_bedtype}")
//	List<RoomDetail> NobytBedtype(RoomDetail roomDetail);
//	
//	//각 타입을 넣어 no 값 가져오기2:누적
//	@Select("select roomdetail_no from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view} and room_location=#{room_location}")
//	List<RoomDetail> LocationForNo(RoomDetail roomDetail);
//	
	@Select("select roomdetail_no from room_detail where room_type_no=#{roomType.no} and room_view=#{room_view} and room_location=#{room_location} and room_bedtype=#{room_bedtype}")
	int BedtypeForNo(RoomDetail roomDetail);
		
	//룸세부사항 수정하기
	@Update("update room_detail set room_price=#{room_price},room_thumb_name=#{room_thumb_name},room_thumb_size=#{room_thumb_size} where roomdetail_no=#{roomdetail_no}")
	void updateDt(RoomDetail roomDetail);

	/*	adm-rooms-list 페이징  */
	// Rooms 가 가진 RoomDetail 가져오기
	@Select("select * from room_detail where roomdetail_no=#{no}")
	RoomDetail selectDt(@Param("no")int room_detail_no);
	
	//페이징을 위해 룸타입에 대한 룸디테일번호 가져오기
	@Select("select roomdetail_no from room_detail where room_type_no=#{room_type_no}")
	List<RoomDetail> numbersByRmType(@Param("room_type_no")int room_type_no);
	//뷰 필터
	@Select("select roomdetail_no from room_detail where room_view=#{room_view}")
	List<RoomDetail> numbersByOnlyView(String room_view);
	//위치 필터
	@Select("select roomdetail_no from room_detail where room_location=#{room_location}")
	List<RoomDetail> numbersbyOnlyLocation(String room_location);
	//베드타입 필터
	@Select("select roomdetail_no from room_detail where room_bedtype=#{room_bedtype}")
	List<RoomDetail> numbersbyOnlyBedtype(String room_bedtype);
	
	// 썸네일(룸타입 + view 별) 가져오기
	@Select("select distinct room_view,room_thumb_name,room_thumb_size from room_detail where room_type_no=#{room_type_no}")
	List<RoomDetail> selectDtThumbnail(@Param("room_type_no")int room_type_no);
}
