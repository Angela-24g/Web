package com.delluna.hotels.ui_index;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.dataservice_point.IPointDetailDAO;
import com.delluna.hotels.dataservice_point.IPointEventDAO;

@Controller
public class IndexController {
	@Autowired IPointEventDAO pointEventDAO;
	@Autowired IPointDetailDAO pointDetailDAO;
	
	@RequestMapping(value={"/index","/"})
	public ModelAndView 인덱스로가기(HttpSession session) {
		
		if(session.getAttribute("no") != null) {
		int member = (Integer)session.getAttribute("no");
		
		//입장시 만료시키기
		pointDetailDAO.expired(member); 
		pointEventDAO.expired(member);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("index_css", "index.css");
		mv.setViewName("index/index");
		return mv;
	}

}
