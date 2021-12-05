package com.delluna.hotels.manage_lifestyle;

import javax.servlet.http.HttpServletRequest;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.util.BusinessResult;

public interface ILifestyleAdmService {
	
	BusinessResult gotoAdmLifestyleWrite();
	BusinessResult registerLifestyle(Lifestyle lifestyle,HttpServletRequest request);
	BusinessResult gotoAmdLifestyleList(int page,String col,String kwd);
	BusinessResult gotoAmdLifestyleView(int no);
	BusinessResult deleteLifestyle(int no);
	BusinessResult gotoUpdateLifestyle(int no);
	BusinessResult updateLifestyle(Lifestyle lifestyle,HttpServletRequest request);
}
