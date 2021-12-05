package com.delluna.hotels.dataservice_lifestyle;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.delluna.hotels.common_lifestyle.LifestyleImage;

@Mapper
public interface ILifestyleImageMapper {

	@Insert("insert into lifestyle_image(name,size,lifestyle_no) values(#{name},#{size},#{lifestyle.no})")
	void save(LifestyleImage lifestyleImage);
	
	@Insert({
		"<script>",
		"insert into lifestyle_image(name,size,lifestyle_no) values",
		"<foreach collection='lifestyleImages' item='lifestyleImage' index='index' separator=','>",
			"(#{lifestyleImage.name},#{lifestyleImage.size},#{lifestyleImage.lifestyle.no})",
		"</foreach>",
		"</script>"
	})
	void saveImages(@Param(value="lifestyleImages")List<LifestyleImage> lifestyleImages);

	@Select("select * from lifestyle_image where lifestyle_no=#{no}")
	List<LifestyleImage> selectByLifestyleNo(@Param("no") int no);
	
	@Update("update lifestyle_image set name=#{name}, size=#{size} where no=#{no}")
	void updateLifestyleImage(LifestyleImage lifestyleImage);
	
	@Insert({
		"<script>","insert into lifestyle_image(no,name,size,lifestyle_no) values ",
			"<foreach collection='lifestyleImages' item='lifestyleImage' index='index' separator=','>",
				"(#{lifestyleImage.no},#{lifestyleImage.name},#{lifestyleImage.size},#{lifestyleImage.lifestyle.no})",
			"</foreach>",
			" on duplicate key update ",
			"name=values(name), size=values(size);",
		"</script>"
		})
	void upInsertLifestyleImages(@Param(value="lifestyleImages")List<LifestyleImage> lifestyleImages);
	
	@Delete("delete from lifestyle_image where lifestyle_no=#{lifestyle_no}")
	void deleteAllLifestyleImage(@Param("lifestyle_no")int lifestyle_no);
	
	@Delete({
		"<script>",
		"delete from lifestyle_image where lifestyle_no=#{lifestyle_no} and no not in(",
			"<foreach collection='lifestyleImages' item='lifestyleImage' index='index' separator=','>",
				"#{lifestyleImage.no}",
			"</foreach>",
		")",
		"</script>"
	})
	void deleteLifestyleImage(@Param("lifestyle_no")int lifestyle_no,@Param(value="lifestyleImages")List<LifestyleImage> lifestyleImages);
}
