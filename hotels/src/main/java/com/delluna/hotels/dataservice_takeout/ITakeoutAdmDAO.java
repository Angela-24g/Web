package com.delluna.hotels.dataservice_takeout;

import java.util.List;


import com.delluna.hotels.common_takeout.TakeoutAdm;

public interface ITakeoutAdmDAO {

	public void save(TakeoutAdm takeoutAdm);
	
	public List<TakeoutAdm> selectAll();
	
	public TakeoutAdm findByNo(int no);
	
	public void updateByNo(TakeoutAdm takeoutAdm);
}
