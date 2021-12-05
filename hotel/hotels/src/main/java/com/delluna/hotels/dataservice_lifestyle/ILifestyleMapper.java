package com.delluna.hotels.dataservice_lifestyle;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_lifestyle.Lifestyle;

@Mapper
public interface ILifestyleMapper {
	
	@Insert("insert into lifestyle(type,subtype,name,info,info_detail,guide,hours,location,contact) "
			+ "values(#{type},#{subtype},#{name},#{info},#{info_detail},#{guide},#{hours},#{location},#{contact})")
	@SelectKey(statement="select last_insert_id()", keyProperty="no", before=false, resultType=int.class)
	public void save(Lifestyle lifestyle);
	
	@Select("select * from lifestyle where no=#{no}")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="type",column="type"),
			@Result(property="subtype",column="subtype"),
			@Result(property="name",column="name"),
			@Result(property="info",column="info"),
			@Result(property="info_detail",column="info_detail"),
			@Result(property="guide",column="guide"),
			@Result(property="hours",column="hours"),
			@Result(property="location",column="location"),
			@Result(property="contact",column="contact"),
			@Result(property="wdate",column="wdate"),
			@Result(property="modify_date",column="modify_date"),
			@Result(property="lifestyleImages",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleImageMapper.selectByLifestyleNo")),
			@Result(property="lifestylePrices",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestylePriceMapper.selectByLifestyleNo")),
			@Result(property="lifestyleFacilities",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleFacilityMapper.selectByLifestyleNo"))
	})
	public Lifestyle selectLifestyleByNo(int no);
	
	@Select("select * from lifestyle")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="type",column="type"),
			@Result(property="subtype",column="subtype"),
			@Result(property="name",column="name"),
			@Result(property="info",column="info"),
			@Result(property="info_detail",column="info_detail"),
			@Result(property="guide",column="guide"),
			@Result(property="hours",column="hours"),
			@Result(property="location",column="location"),
			@Result(property="contact",column="contact"),
			@Result(property="wdate",column="wdate"),
			@Result(property="modify_date",column="modify_date"),
			@Result(property="lifestyleImages",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleImageMapper.selectByLifestyleNo")),
			@Result(property="lifestylePrices",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestylePriceMapper.selectByLifestyleNo")),
			@Result(property="lifestyleFacilities",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleFacilityMapper.selectByLifestyleNo"))
	})
	public List<Lifestyle> selectAll();
	
	@Select("select * from lifestyle where type=#{type} and subtype=#{subtype}")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="type",column="type"),
			@Result(property="subtype",column="subtype"),
			@Result(property="name",column="name"),
			@Result(property="info",column="info"),
			@Result(property="info_detail",column="info_detail"),
			@Result(property="guide",column="guide"),
			@Result(property="hours",column="hours"),
			@Result(property="location",column="location"),
			@Result(property="contact",column="contact"),
			@Result(property="wdate",column="wdate"),
			@Result(property="modify_date",column="modify_date"),
			@Result(property="lifestyleImages",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleImageMapper.selectByLifestyleNo")),
			@Result(property="lifestylePrices",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestylePriceMapper.selectByLifestyleNo")),
			@Result(property="lifestyleFacilities",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleFacilityMapper.selectByLifestyleNo"))
	})
	public Lifestyle selectSsub(String type, String subtype);
	
	@Update("update lifestyle set name=#{name},info=#{info},info_detail=#{info_detail},guide=#{guide},hours=#{hours},location=#{location},contact=#{contact},modify_date=#{modify_date} where no=#{no}")
	public void updateLifestyle(Lifestyle lifestyle);
	
	@Delete("delete from lifestyle where no=#{no}")
	void deleteLifestyle(@Param("no")int no);
	
	@Select("select count(*) from lifestyle")
	int countAll();
	
	@Select("select count(*) from lifestyle where type=#{type}")
	int getCount(@Param("type") String type);
	
	@Select("select * from lifestyle order by no limit #{startPage},#{perpage}")
	List<Lifestyle> selectLifeLimit(@Param("startPage") int startPage,@Param("perpage")int perpage);
	
	@Select("select * from lifestyle where type=#{type} order by no limit #{startPage},#{perpage}")
	List<Lifestyle> selectKwdLifeLimit(@Param("type")String type, @Param("startPage") int startPage,@Param("perpage")int perpage);

	@Select("select type,subtype from lifestyle where type=#{type}")
	List<Lifestyle> selectTypeSubtype(@Param("type")String type);
	
	@Select("select * from lifestyle where type=#{type} and subtype=#{subtype}")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="type",column="type"),
			@Result(property="subtype",column="subtype"),
			@Result(property="name",column="name"),
			@Result(property="info",column="info"),
			@Result(property="info_detail",column="info_detail"),
			@Result(property="guide",column="guide"),
			@Result(property="hours",column="hours"),
			@Result(property="location",column="location"),
			@Result(property="contact",column="contact"),
			@Result(property="wdate",column="wdate"),
			@Result(property="modify_date",column="modify_date"),
			@Result(property="lifestyleImages",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleImageMapper.selectByLifestyleNo")),
			@Result(property="lifestylePrices",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestylePriceMapper.selectByLifestyleNo")),
			@Result(property="lifestyleFacilities",javaType=List.class,column="no",many=@Many(select="com.delluna.hotels.dataservice_lifestyle.ILifestyleFacilityMapper.selectByLifestyleNo"))
	})
	Lifestyle selectByTypeSubt(@Param("type")String type,@Param("subtype")String subtype);
}
