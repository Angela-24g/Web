package com.delluna.hotels.dataservice_takeout;

import java.util.List;

import com.delluna.hotels.common_takeout.Takeout;

public interface ITakeoutDAO {

	public void save(Takeout takeout);
	
	public List<Takeout> selectAll();
	
	public void findByNo(int no);
	
	public void updateByNo(Takeout takeout);
	
}
