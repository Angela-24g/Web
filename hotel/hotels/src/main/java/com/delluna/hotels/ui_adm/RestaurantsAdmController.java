package com.delluna.hotels.ui_adm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.dataservice_restaurants.IRestaurantsDAO;

@Controller
public class RestaurantsAdmController {
	@Autowired
	IRestaurantsDAO restaurantsDAO;
	//@Autowired
	//@Qualifier("pagingService")
	//IPagingService pagingService;

	@RequestMapping("/adm/user-rt-list")
	public ModelAndView gotoAdmRestaurantsList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = false) String kwd,
			@RequestParam(value = "col", required = false) String col) {
		List<Restaurants> rtList = restaurantsDAO.selectAll();
		//Paging paging = new Paging();

		//paging = pagingService.makeBlock(page);
		//List<Restaurants> rtList = null;
		//if (kwd == null) {
		//	pagingService.makeLastPageNum(paging, "rastaurants");
		//	rtList = restaurantsDAO.selectPage(page, 5, "restaurant_name", "");
		//} else {
		//	pagingService.makeLastPageNum(paging, "rastaurants", kwd, col);
		//	rtList = restaurantsDAO.selectPage(page, 5, col, kwd);
		//}
		//Integer blockStartNum = paging.getBlockStartNum();
		//Integer blockLastNum = paging.getBlockLastNum();
		//Integer lastPageNum = paging.getLastPageNum();

		ModelAndView mv = new ModelAndView();
		//mv.addObject("blockStartNum", blockStartNum);
		//mv.addObject("blockLastNum", blockLastNum);
		//mv.addObject("lastPageNum", lastPageNum);
		mv.addObject("rtList", rtList);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("adm/user-rt-list");
		return mv;
	}

	@GetMapping("/adm/user-rt-view/{no}")
	public ModelAndView gotoAdmRestaurantsView(@PathVariable int no) {
		Restaurants rtView = restaurantsDAO.findByNo(no);
		Restaurants viewPrev = restaurantsDAO.findByPrev(no);
		Restaurants viewNext = restaurantsDAO.findByNext(no);

		ModelAndView mv = new ModelAndView();
		mv.addObject("rtView", rtView);
		mv.addObject("viewPrev", viewPrev);
		mv.addObject("viewNext", viewNext);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("adm/user-rt-view");
		return mv;
	}
	
	@GetMapping("/adm/user-rt-update/{no}")
	public ModelAndView gotoRtUpdate(@PathVariable int no) {
		Restaurants rtUpdate = restaurantsDAO.findByNo(no);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("rtUpdate", rtUpdate);
		mv.addObject("css","adm/adm.css");
		mv.addObject("js","adm/adm.js");
		mv.setViewName("/adm/user-rt-update");
		return mv;
	}
	
	@RequestMapping(value = "/adm/user-rt-update", method = RequestMethod.POST)
	public ModelAndView saveRtUpdate(@ModelAttribute Restaurants rtUpdate) {
		restaurantsDAO.editRt(rtUpdate);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adm/user-rt-list");
		return mv;
    }

	@GetMapping("/adm/user-rt-delete/{no}")
	public ModelAndView deleteRestaurants(@PathVariable int no) {
		restaurantsDAO.delete(no);

		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("adm/user-rt-list");
		return mv;
	}

}
