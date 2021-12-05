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

import com.delluna.hotels.common_takeout.TakeoutProduct;

@Mapper
public interface ITakeoutProductMapper {

	@Insert("insert into takeout_product(name,price,takeout_adm_no) values(#{name},#{price},#{takeout_adm_no.no})")
	public void save(TakeoutProduct takeoutProduct);
	
	@Select("select * from takeout_product where takeout_adm_no=#{takeout_adm_no}")
	@Results(value= {
			@Result(property = "no", column = "no"),
			@Result(property = "name", column = "name"),
			@Result(property = "price", column = "price"),
			@Result(property = "takeout_adm_no", column = "takeout_adm_no", one = @One(select="com.delluna.hotels.dataservice_takeout.findByNo"))
	})
	public List<TakeoutProduct> findByNo(@Param("takeout_adm_no") int takeout_adm_no);
	
	@Delete("delete from takeout_product where takeout_adm_no=#{takeout_adm_no}")
	public void deleteByNo(@Param("takeout_adm_no") int takeout_adm_no);
}
