package com.delluna.hotels.dataservice_rooms;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.Rooms;

@Mapper
public interface IRoomsMapper {
	
	/* 관리자 페이지 사용 */
	//룸 저장하기
	@Insert("insert into rooms(room_number,room_detail_no) values(#{room_number},#{roomDetail.roomdetail_no})")
	void save(Rooms room);
	
	//룸 한번에 저장하기
	@Insert({
		"<script>",
		"insert into rooms(room_number,room_detail_no) values",
		"<foreach collection='rooms' item='room' index='index' separator=','>",
			"(#{room.room_number},#{room.roomDetail.roomdetail_no})",
		"</foreach>",
		"</script>"
	})
	void saveRooms(@Param(value="rooms")List<Rooms> rooms);
	
	//룸 가져오기 - 예약테이블에서 FK 인 rooms_no 로 찾기 
	@Select("select * from rooms where no=#{no}")
	Rooms selectByNo(@Param(value="no")int no);
	
	
	/* 예약 시 사용	*/
	/* 룸 예약가능한 방 있는지 확인하기 roomDetail.no + state("예약대기") */
	
//	//1. room_type.no ,view,location 에 따른 모든 room_detail 번호
//	@Select({
//		"<script>",
//		"select if(count(*)>0,1,0) from rooms where room_detail_no in (",
//		"<foreach collection='roomDetails' item='roomDetail' index='index' separator=','>",
//			"#{roomDetail.roomdetail_no}",
//		"</foreach>",
//		") and state=#{state}",
//		"</script>"
//	})
//	boolean isInRooms(@Param(value="roomDetails")List<RoomDetail> roomDetails,@Param(value="state")String state);
	
	//마지막 베드타입 까지 선택한 경우
	@Select("select if(count(*)>0,1,0) from rooms where room_detail_no=#{roomdetail_no} and state=#{state}")
	boolean isInRoomsLast(@Param(value="roomdetail_no")int roomdetail_no,@Param(value="state")String state);
	
	//룸 가져오기 - FK이자 예약시 결정한 옵션인 RoomDetail 번호로 찾기 + 예약상태 선택(예약대기,예약중)
	@Select("select * from rooms where room_detail_no=#{no} and state=#{state} limit 1")
	Rooms selectByRoomDtNo(@Param(value="no")int no,@Param(value="state")String state);
	
	//룸 수정하기 - '예약중' 또는 '예약대기' 로 변경
	@Update("update rooms set state=#{state} where no=#{no}")
	void updateState(@Param(value="no")int no,@Param("state")String state);
	
	//룸 수정하기 - RoomDetail -> RoomType 까지 select: 차후에
	@Update("update rooms set room_number=#{room_number} where no=#{roomDetail.roomdetail_no}")
	void updateRoom(Rooms room);
	
	/* 페이징 */	
	//룸 총 갯수 가져오기
	@Select("select count(*) from rooms")
	int getCount();
	
	//룸 전체 가져오기
	@Select("select * from rooms order by no limit #{startPage},#{perpage}")
	List<Rooms> selectRooms(@Param("startPage")int startPage,@Param("perpage") int perpage);
	
	//룸 가져오기 - 디테일 조건에 따라
	@Select({
		"<script>",
		"select * from rooms where room_detail_no in (",
		"<foreach collection='roomDetails' item='roomDetail' index='index' separator=','>",
		"#{roomDetail.roomdetail_no}",
		"</foreach>",
		") order by no limit #{startPage},#{perpage}",
		"</script>"
	})
	List<Rooms> selectLimit(@Param(value="roomDetails")List<RoomDetail> roomDetails,@Param("startPage")int startPage,@Param("perpage") int perpage);
	
	//룸 가져오기 - state 에 따라
	@Select("select * from rooms where state=#{state} limit #{startPage},#{perpage}")
	List<Rooms> selectByState(@Param(value="state")String state,@Param("startPage")int startPage,@Param("perpage")int perpage);
	
	//예약에서 룸 찾기
	@Select("select * from rooms where no=#{no}")
	public Rooms findByNo(@Param("no")int no);
}
