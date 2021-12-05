package com.delluna.hotels.dataservice_lifestyle;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_lifestyle.LifestyleFacility;

@Mapper
public interface ILifestyleFacilityMapper {

	@Insert("insert into lifestyle_facility(lifeFacility_image_name,lifeFacility_image_size,lifeFacility_title,lifeFacility_info,lifestyle_no) values(#{lifeFacility_image_name},#{lifeFacility_image_size},#{lifeFacility_title},#{lifeFacility_info},#{lifestyle.no})")
	void save(LifestyleFacility lifestyleFacility);
	
	@Insert({
		"<script>",
		"insert into lifestyle_facility(lifeFacility_image_name,lifeFacility_image_size,lifeFacility_title,lifeFacility_info,lifestyle_no) values",
		"<foreach collection='lifestyleFacilities' item='lifestyleFacility' index='index' separator=','>",
			"(#{lifestyleFacility.lifeFacility_image_name},#{lifestyleFacility.lifeFacility_image_size},#{lifestyleFacility.lifeFacility_title},#{lifestyleFacility.lifeFacility_info},#{lifestyleFacility.lifestyle.no})",
		"</foreach>",
		"</script>"
	})
	void saveFacility(@Param(value="lifestyleFacilities")List<LifestyleFacility> lifestyleFacilities);

	@Select("select * from lifestyle_facility where lifestyle_no=#{no}")
	List<LifestyleFacility> selectByLifestyleNo(@Param("no") int no);
	
	@Update("update lifestyle_facility set lifeFacility_image_name=#{lifeFacility_image_name}, lifeFacility_image_size=#{lifeFacility_image_size}, lifeFacility_title=#{lifeFacility_title}, lifeFacility_info=#{lifeFacility_info} where lifeFacility_no=#{lifeFacility_no}")
	void updateLifestyleFacility(LifestyleFacility lifestyleFacility);
	
	@Insert({
		"<script>","insert into lifestyle_facility(lifeFacility_no,lifeFacility_image_name,lifeFacility_image_size,lifeFacility_title,lifeFacility_info,lifestyle_no) values ",
			"<foreach collection='lifestyleFacilities' item='lifestyleFacility' index='index' separator=','>",
				"(#{lifestyleFacility.lifeFacility_no},#{lifestyleFacility.lifeFacility_image_name},#{lifestyleFacility.lifeFacility_image_size},#{lifestyleFacility.lifeFacility_title},#{lifestyleFacility.lifeFacility_info},#{lifestyleFacility.lifestyle.no})",
			"</foreach>",
			" on duplicate key update ",
			"lifeFacility_image_name=values(lifeFacility_image_name), lifeFacility_image_size=values(lifeFacility_image_size), lifeFacility_title=values(lifeFacility_title),lifeFacility_info=values(lifeFacility_info);",
		"</script>"
		})
	void upInsertLifestyleFacility(@Param(value="lifestyleFacilities")List<LifestyleFacility> lifestyleFacilities);
	
	@Delete("delete from lifestyle_facility where lifestyle_no=#{lifestyle_no}")
	void deleteAllLifestyleFacility(@Param("lifestyle_no")int lifestyle_no);
	
	@Delete({
		"<script>",
		"delete from lifestyle_facility where lifestyle_no=#{lifestyle_no} and lifeFacility_no not in(",
		"<foreach collection='lifestyleFacilities' item='lifestyleFacility' index='index' separator=','>",
		"#{lifestyleFacility.lifeFacility_no}",
		"</foreach>",
		")",
		"</script>"
	})
	void deleteLifestyleFacility(@Param("lifestyle_no")int lifestyle_no,@Param(value="lifestyleFacilities")List<LifestyleFacility> lifestyleFacilities);
}