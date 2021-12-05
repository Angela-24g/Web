package com.delluna.hotels.ui_sitemap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SiteMapController {
	@RequestMapping("/site-map")
    public ModelAndView gotoAboutUs() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","info/sitemap.css");
		mv.setViewName("info/site-map");
		return mv;
    }
}
