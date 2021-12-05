package com.delluna.hotels.manage_lifestyle;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.dataservice_lifestyle.ILifestyleDAO;
import com.delluna.hotels.util.BusinessResult;

@Service("lifestyleService")
public class LifestyleService implements ILifestyleService{
	@Autowired ILifestyleDAO lifestyleDAO;
	
	@Override
	public BusinessResult goLifestyle(String type,String subtype) {
		Lifestyle lifestyle = lifestyleDAO.selectByTypeSubt(type, subtype);
		List<Lifestyle> typeSubtypeLifestyles = lifestyleDAO.selectTypeSubtype(type);
		
		HashMap<String, Object> lifestyleMap = new HashMap<String, Object>();
		lifestyleMap.put("lifestyle", lifestyle);
		lifestyleMap.put("typeSubtypeLifestyles", typeSubtypeLifestyles);
		
		return new BusinessResult(lifestyleMap);
	}


}
