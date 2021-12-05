package com.delluna.hotels.ui_lifestyle;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.manage_lifestyle.ILifestyleService;
import com.delluna.hotels.util.BusinessResult;

@Controller
public class LifestyleController {
	
	@Autowired @Qualifier("lifestyleService") ILifestyleService lifestyleService;
	
	@RequestMapping(value={"/lifestyle","/lifestyle/{category}" })
	public ModelAndView goLifestyle(@PathVariable(value = "category",required = false) String category){
		ModelAndView mv = new ModelAndView();
		BusinessResult br = null;
		
		if(category == null) {//기본 lifestyle 경로
			br = lifestyleService.goLifestyle("spa","씨메르");
			
		}else {
			if(category.equals("spa")) {//spa 일 때
				br = lifestyleService.goLifestyle(category,"씨메르");
			}else if(category.equals("kids village")) {//kids village 일 때
				br = lifestyleService.goLifestyle(category,"BMW 키즈 드라이빙");
			}
		}
		
		HashMap<String, Object> lifestyleMap = (HashMap<String, Object>)br.getValue();
		Lifestyle lifestyle = (Lifestyle)lifestyleMap.get("lifestyle");
		List<Lifestyle> typeSubtypeLifestyles = (List<Lifestyle>)lifestyleMap.get("typeSubtypeLifestyles");
		
		mv.addObject("lifestyle", lifestyle);
		mv.addObject("typeSubtypeLifestyles", typeSubtypeLifestyles);
		
		mv.setViewName("lifestyle/lifestyle");
		//mv.setViewName("lifestyle/spa-cimer");
		mv.addObject("css","lifestyle/lifestyle.css");
		mv.addObject("js","lifestyle/lifestyle.js");

		return mv;
	}
	
	@RequestMapping(value="/lifestyle/{category}/{subcategory}")
	public ModelAndView goLifestyleSubmenu(@PathVariable String category,@PathVariable String subcategory){
		ModelAndView mv = new ModelAndView();
		
		BusinessResult br = lifestyleService.goLifestyle(category,subcategory);
		
		HashMap<String, Object> lifestyleMap = (HashMap<String, Object>)br.getValue();
		
		Lifestyle lifestyle = (Lifestyle)lifestyleMap.get("lifestyle");
		List<Lifestyle> typeSubtypeLifestyles = (List<Lifestyle>)lifestyleMap.get("typeSubtypeLifestyles");
		
		mv.addObject("lifestyle", lifestyle);
		mv.addObject("typeSubtypeLifestyles", typeSubtypeLifestyles);
		
		mv.setViewName("lifestyle/lifestyle");
		//mv.setViewName("lifestyle/"+category+"-"+subcategory);
		mv.addObject("css","lifestyle/lifestyle.css");
		mv.addObject("js","lifestyle/lifestyle.js");
		
		return mv;
	}
	
}
