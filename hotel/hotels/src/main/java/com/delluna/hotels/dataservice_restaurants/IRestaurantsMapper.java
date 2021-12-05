package com.delluna.hotels.dataservice_restaurants;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;

@Mapper
public interface IRestaurantsMapper {
	@Insert("INSERT INTO restaurants(restaurant_name,date_reserve,time_meal,count_adult,count_elementary,count_child,count_baby,count_all,name,tel,email,add_request,writer) values(#{restaurant_name},#{date_reserve},#{time_meal},#{count_adult},#{count_elementary},#{count_child},#{count_baby},#{count_all},#{name},#{tel},#{email},#{add_request},#{writer.no})")
	@SelectKey(statement = "select last_insert_id()", keyProperty = "no", before = false, resultType = int.class)
	public void save(Restaurants restaurants);
	
	@Insert("INSERT INTO restaurants_nonmember(restaurant_name,date_reserve,time_meal,count_adult,count_elementary,count_child,count_baby,count_all,name,tel,email,add_request) values(#{restaurant_name},#{date_reserve},#{time_meal},#{count_adult},#{count_elementary},#{count_child},#{count_baby},#{count_all},#{name},#{tel},#{email},#{add_request})")
	@SelectKey(statement = "select last_insert_id()", keyProperty = "no", before = false, resultType = int.class)
	public void saveNon(RestaurantsNon restaurantsNon);
	
	@Update("UPDATE restaurants SET tel=#{tel}, email=#{email}, add_request=#{add_request} WHERE no=#{no}")
	public void editRt(Restaurants rtUpdate);
	
	@Update("UPDATE restaurants SET state=#{state} WHERE no=#{no}")
	public void updateRt(@Param("state") String state,@Param("no") int no);

	@Delete("DELETE FROM restaurants WHERE no=#{no}") 
	public void delete(int no);

	@Select("SELECT * FROM restaurants WHERE no=#{no}")
	public Restaurants findByNo(@Param("no") int no);

	@Select("SELECT * FROM restaurants WHERE no < #{no} ORDER BY no DESC LIMIT 1")
	public Restaurants findByPrev(int no);

	@Select("SELECT * FROM restaurants WHERE no > #{no} ORDER BY no LIMIT 1")
	public Restaurants findByNext(int no);

	@Select("SELECT * FROM restaurants ORDER BY no DESC")
	public List<Restaurants> selectAll();
	
	@Select("SELECT * FROM restaurants WHERE writer = #{member_no} ORDER BY no DESC")
	public List<Restaurants> selectAllByMemberNo(int member_no);

	@Select("select * from restaurants order by no limit #{startPage},#{perpage}")
	public List<Restaurants> selectPage(int page, int perpage, String col, String kwd);

	@Select("select count(*) from restaurants")
	public int getCount();

	@Select("Select * from restaurants_nonmember where name=#{name} and tel=#{tel}")
	public List<RestaurantsNon> selectNonAll(@Param("name")String name,@Param("tel")String tel);
	
	@Select("Select * from restaurants_nonmember where name=#{name} and tel=#{tel}")
	public RestaurantsNon selectNonall(@Param("name")String name,@Param("tel")String tel);
	
	@Select("Select no from restaurants_nonmember where name=#{name} and tel=#{tel}")
	public int resNo();
	
	@Update("UPDATE restaurants_nonmember SET state=#{state} WHERE no=#{no}")
	public void updateRt1(@Param("state") String state,@Param("no") int no);
	
	@Select("select if(count(*)!=0,1,0) from restaurants_nonmember where name=#{name} and tel=#{tel}")
	public boolean isnon(@Param("name")String name,@Param("tel")String tel);

}
