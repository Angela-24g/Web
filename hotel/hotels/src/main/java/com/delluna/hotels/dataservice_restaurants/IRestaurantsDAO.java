package com.delluna.hotels.dataservice_restaurants;

import java.util.List;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;

public interface IRestaurantsDAO {
	public void save(Restaurants restaurants);

	public void saveNon(RestaurantsNon restaurantsNon);

	public void editRt(Restaurants rtUpdate);

	public void delete(int no);

	public void update(String state, int no);

	public Restaurants findByNo(int no);

	public Restaurants findByPrev(int no);

	public Restaurants findByNext(int no);

	public List<Restaurants> selectAll();

	public List<Restaurants> selectAllByMemberNo(int member_no);

	public List<Restaurants> selectPage(int page, int perpage, String col, String kwd);

	public int getCount();

	public int getCount(String kwd, String col);
	
	public RestaurantsNon selectNonall(String name,String tel);
	
	public List<RestaurantsNon> selectNonAll(String name,String tel);
	
	public int resNo();
	
	public void updateRt1(String state,int no);
	
	public boolean isnon(String name,String tel);
}
