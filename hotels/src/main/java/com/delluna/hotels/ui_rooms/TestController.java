package com.delluna.hotels.ui_rooms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;

@Controller
public class TestController {

	@RequestMapping("/test")
	public ModelAndView goTest() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("css","adm/adm-rooms.css");
		mv.addObject("js","rooms/test.js");
		mv.setViewName("test/test");
		return mv;
	}
	
	@RequestMapping("/test/ajax")
	@ResponseBody
	public void goAjax(RezAdmRoomType rezAdmRoomType, RoomDetail roomDetail) {
		System.out.println(rezAdmRoomType.getRoomType().getType());
		System.out.println(roomDetail.getRoomType().getType());
	}
	
}
