package com.delluna.hotels.dataservice_rooms;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_rooms.RoomType;

@Mapper
public interface IRoomTypeMapper {
	
	/* 관리자 페이지 */
	/* 룸 타입 정보 등록 */
	@Insert("insert into room_type(type,adult_cnt,title,info) values(#{type},#{adult_cnt},#{title},#{info})")
	@SelectKey(statement="select last_insert_id()", keyProperty="no", before=false, resultType=int.class)
	void save(RoomType roomType);
	
	/* 룸타입 존재여부 파악1 - 중복저장방지 */
	@Select("select if(count(*)=1,1,0) from room_type where type=#{type}")
	boolean isInType(@Param("type")String type);
	
	/* 룸타입 존재여부 파악2 - 존재하는룸:번호만갖고오기 */
	@Select("select no from room_type where type=#{type}")
	int selectNo(String type);
	
	/* 관리자페이지 룸관리 출력 */	
	@Select("select no from room_type")
	List<Integer> selectAllNo();
	
	/* 룸 리스트 */
	@Select("select * from room_type")
	List<RoomType> selectAll();
	
	/* 룸타입 출력하기(rez_adm_room_type + room_detail에서 추출) - 예약 + 예약목록에서 (ex.디럭스) */
	@Select("select * from room_type where no=#{no}")
	RoomType selecByNo(@Param("no")int room_type_no);
	
	
	/* 룸 타입 정보 수정 - update는 DAO 에서 현재날짜넣기*/
	@Update("update room_type set adult_cnt=#{adult_cnt},title=#{title},info=#{info},modify_date=#{modify_date} where no=#{no}")
	void updateRoomType(RoomType roomType);
	
}