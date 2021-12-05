package com.delluna.hotels.dataservice_takeout;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_takeout.TakeoutAdm;

@Mapper
public interface ITakeoutAdmMapper {

	@Insert("insert into takeout_adm(title,content,sales_unit,weight,packaging,location) values(#{title},#{content},#{sales_unit},#{weight},#{weight},#{packaging},#{location})")
	public void save(TakeoutAdm takeoutAdm);
	
	@Select("select * from takeout_adm")
	public List<TakeoutAdm> selectAll();
	
	@Select("select * from takeout_adm where no=#{no}")
	public TakeoutAdm findByNo(@Param("no") int no);
	
	@Update("update takeout_adm set title=#{title}, content=#{content}, sales_unit=#{sales_unit}, weight=#{weight}, packaging=#{packaging} where no=#{no}")
	public void updateByNo(TakeoutAdm takeoutAdm);
	
	@Delete("delete from takeout_adm where no=#{no}")
	public void DeleteByNo(@Param("no") int no);
}
