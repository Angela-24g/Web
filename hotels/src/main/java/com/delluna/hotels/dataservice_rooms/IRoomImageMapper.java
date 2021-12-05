package com.delluna.hotels.dataservice_rooms;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_rooms.RoomImage;

@Mapper
public interface IRoomImageMapper {

	// 룸 이미지 저장하기
	@Insert("insert into room_image(name,size,room_detail_no) values(#{name},#{size},#{roomDetail.roomdetail_no}")
	void save(RoomImage roomImage);
	
	// 룸 이미지 저장하기 한번에
	@Insert({
		"<script>",
		"insert into room_image(name,size,room_detail_no) values",
		"<foreach collection='roomImages' item='roomImage' index='index' separator=','>",
			"(#{roomImage.name},#{roomImage.size},#{roomImage.roomDetail.roomdetail_no})",
		"</foreach>",
		"</script>"
	})
	void saveImages(@Param(value="roomImages")List<RoomImage> roomImages);
	
	// RoomDetail.no ( 해당 번호는 RoomType + view + location 까지 거른 번호
	@Select("select distinct name,size from room_image where room_detail_no=#{no}")
	List<RoomImage> selectByRDNo(@Param("no")int no);
	
	@Update("update room_image set name=#{name},size=#{size} where no=#{roomDetail.roomdetail_no}")
	void updateRoomImage(RoomImage roomImgae);
	
}
