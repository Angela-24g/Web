package com.delluna.hotels.dataservice_takeout;

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

import com.delluna.hotels.common_takeout.Takeout;

@Mapper
public interface ITakeoutMapper {

	@Insert("insert into takeout(count,date_pick,product,price,add_request,state,name,tel,email,writer,takeout_adm_no) values(#{count},#{date_pick},#{product},#{price},#{weight},#{add_request},#{state},#{name},#{name},#{tel},#{email},#{writer.no},#{takeout_adm_no.no})")
	@SelectKey(statement="select last_insert_id()", keyProperty="takeout_adm_no", before=false, resultType=int.class)
	public void save(Takeout takeout);
	
	@Select("select * from takeout")
	@Results(value= {
			@Result(property = "no", column = "no"),
			@Result(property = "count", column = "count"),
			@Result(property = "date_write", column = "date_write"),
			@Result(property = "date_pick", column = "date_pick"),
			@Result(property = "product", column = "product"),
			@Result(property = "price", column = "price"),
			@Result(property = "add_request", column = "add_request"),
			@Result(property = "state", column = "state"),
			@Result(property = "name", column = "name"),
			@Result(property = "tel", column = "tel"),
			@Result(property = "email", column = "email"),
			@Result(property = "writer", column = "writer", one = @One(select="com.delluna.hotels.dataservice_member.findByNo")),
			@Result(property = "takeout_adm_no", column = "takeout_adm_no", one = @One(select="com.delluna.hotels.dataservice_takeout.findByNo"))
	})
	public List<Takeout> selectAll();
	
	@Select("select * from takeout where no=#{no}")
	@Results(value= {
			@Result(property = "no", column = "no"),
			@Result(property = "count", column = "count"),
			@Result(property = "date_write", column = "date_write"),
			@Result(property = "date_pick", column = "date_pick"),
			@Result(property = "product", column = "product"),
			@Result(property = "price", column = "price"),
			@Result(property = "add_request", column = "add_request"),
			@Result(property = "state", column = "state"),
			@Result(property = "name", column = "name"),
			@Result(property = "tel", column = "tel"),
			@Result(property = "email", column = "email"),
			@Result(property = "writer", column = "writer", one = @One(select="com.delluna.hotels.dataservice_member.findByNo")),
			@Result(property = "takeout_adm_no", column = "takeout_adm_no", one = @One(select="com.delluna.hotels.dataservice_takeout.findByNo"))
	})
	public void findByNo(@Param("no") int no);
	
	@Update("update takeout set state=#{state} where no=#{no}")
	public void updateByNo(Takeout takeout);
	
}
