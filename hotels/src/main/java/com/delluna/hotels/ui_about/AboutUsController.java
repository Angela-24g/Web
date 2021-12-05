package com.delluna.hotels.ui_about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutUsController {
	@RequestMapping("/about-us")
    public ModelAndView gotoAboutUs() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","about/about.css");
		mv.addObject("js","about/about.js");
		mv.setViewName("about/about-us");
		return mv;
    }
}
