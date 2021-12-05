package com.delluna.hotels.ui_takeout;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_takeout.TakeoutAdm;
import com.delluna.hotels.dataservice_takeout.ITakeoutAdmMapper;

@Controller
public class TakeoutAdmController {
	@Autowired ITakeoutAdmMapper takeoutAdmMapper;

	@GetMapping("adm/takeout")
	public ModelAndView takeoutAdmList() {
		
		List<TakeoutAdm> takeoutAdmList = takeoutAdmMapper.selectAll();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("takeoutAdmList", takeoutAdmList);
		mv.setViewName("adm/adm-takeout-list");
		
		return mv;
	}
	
	@GetMapping("adm/takeout/{no}")
	public ModelAndView takeoutAdmView(@PathVariable("no") int no) {
		
		TakeoutAdm takeoutAdm = takeoutAdmMapper.findByNo(no);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("takeoutAdm", takeoutAdm);
		mv.setViewName("adm/adm-takeout-view");
		
		return mv;
	}
	
	@GetMapping("adm/takeout/write")
	public String takeoutAdmWriteReady() {
		
		return "adm/adm-takeout-write";
	}
	
	@PostMapping("adm/takeout/write")
	public ModelAndView takeoutAdmWrite(@ModelAttribute TakeoutAdm takeoutAdm) {
		
		takeoutAdmMapper.save(takeoutAdm);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adm/adm-takeout-write");
		
		return mv;
	}
	
	@PostMapping("adm/takeout/delete/{no}")
	public ModelAndView takeoutAdmDelete() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adm/adm-takeout-delete");
		return mv;
	}
}
