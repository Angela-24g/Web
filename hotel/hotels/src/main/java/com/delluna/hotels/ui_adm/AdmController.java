package com.delluna.hotels.ui_adm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdmController {
	@RequestMapping(value = { "/adm/index", "/adm" })
    public ModelAndView gotoAdmIndex() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm.css");
		mv.addObject("js","adm/adm.js");
		mv.setViewName("adm/adm-index");
		return mv;
    }
	
}
