package com.delluna.hotels.dataservice_takeout;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_takeout.TakeoutAttach;

@Mapper
public interface ITakeoutAttachMapper {

	@Insert("insert into takeout_attach(name,size,takeout_adm_no) values(#{name},#{size},#{takeout_adm_no.no})")
	public void save(TakeoutAttach takeoutAttch);
	
	@Insert({
		"<script>",
		"insert into room_image(name,size,room_detail_no) values",
		"<foreach collection='takeoutAttachs' item='takeoutAttach' index='index' separator=','>",
			"(#{takeoutAttach.name},#{takeoutAttach.size},#{takeoutAttach.takeout_adm_no.no})",
		"</foreach>",
		"</script>"
	})
	public void saveAttach(@Param(value="takeoutAttachs")List<TakeoutAttach> takeoutAttchs);
	
	@Select("select distinct name,size from takeout_attach where takeout_adm_no=#{no}")
	public List<TakeoutAttach> selectByNo(@Param("no") int no);
	
	@Update("update takeout_attach set name=#{name}, size=#{size} where no=#{no}")
	public void updateTakeoutAttach(TakeoutAttach takeoutAttch);
}
