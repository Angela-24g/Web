package com.delluna.hotels.ui_event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	@RequestMapping("/event")
	public ModelAndView event(@RequestParam(defaultValue = "1") String PAGE_NO0) {
		ModelAndView mv = new ModelAndView();
		System.out.println(PAGE_NO0);
		mv.addObject("css", "event/event.css");
		mv.addObject("js", "event/event.js");
		mv.setViewName("event/event"+PAGE_NO0);
		return mv;
	}
	
	
	@RequestMapping("/event/eventView")
	public ModelAndView eventView(@RequestParam(defaultValue = "1") String P_SEQ) {
		System.out.println("sfdf");
		System.out.println(P_SEQ);
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "event/event_sub.css");
		mv.addObject("js", "event/event_sub.js");
		mv.setViewName("/event/event_sub/event_sub"+P_SEQ);
		return mv;
	}
}
