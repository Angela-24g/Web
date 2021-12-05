package com.delluna.hotels.dataservice_lifestyle;

import java.util.List;

import com.delluna.hotels.common_lifestyle.Lifestyle;

public interface ILifestyleDAO {

	public void save(Lifestyle lifestyle);
	public List<Lifestyle> selectAll();
	public Lifestyle selectSsub(String type, String subtype);
	public void updateLifestyle(Lifestyle lifestyle);
	public Lifestyle selectLifestyleByNo(int no);
	void deleteLifestyle(int lifestyle_no);
	void deleteLifestyleDt(Lifestyle lifestyle);
	int countAll();
	int getCount(String type);
	List<Lifestyle> selectLifeLimit(int page,int perpage);
	List<Lifestyle> selectKwdLifeLimit(String type,int page,int perpage);
	List<Lifestyle> selectTypeSubtype(String type);
	Lifestyle selectByTypeSubt(String type,String subtype);
}
