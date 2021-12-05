package com.delluna.hotels.ui_policy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class policyController {

	@RequestMapping("/policy/agreement")
	public ModelAndView agreement() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/policy/agreement");
		mv.addObject("css", "policy/agreement.css");
		
		return mv;
	}
	
	@RequestMapping("/policy/privacy")
	public ModelAndView privacy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/policy/privacy");
		mv.addObject("css", "policy/privacy.css");
		
		return mv;
	}
}
