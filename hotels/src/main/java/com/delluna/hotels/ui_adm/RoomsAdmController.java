package com.delluna.hotels.ui_adm;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.common_rooms.Rooms;
import com.delluna.hotels.manage_paging.IPagingService;
import com.delluna.hotels.manage_rooms.IRoomAdmService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.Paging;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class RoomsAdmController {
	@Autowired(required=false) @Qualifier("roomAdmService") IRoomAdmService roomAdmService;
	@Autowired(required=false) @Qualifier("pagingService") IPagingService pagingService;
	
	@RequestMapping(value="/adm/rooms/mainList",method=RequestMethod.GET)
    public ModelAndView gotoAdmMainList() {		
		BusinessResult br = roomAdmService.gotoAdmMainList();
		
		HashMap<String, Object> map = (HashMap<String, Object>)br.getValue();
		ModelAndView mv = new ModelAndView();
		List<String> strs =(List<String>)map.get("디럭스");

		mv.addObject("deluxeList",(List<String>)map.get("디럭스"));
		
		mv.addObject("premiumdeluxeList",(List<String>)map.get("프리미엄 디럭스"));
		
		mv.addObject("suiteList",(List<String>)map.get("스위트"));
		
		mv.addObject("deluxeView",(List<String>)map.get("디럭스뷰"));
		mv.addObject("premiumdeluxeView",(List<String>)map.get("프리미엄 디럭스뷰"));
		mv.addObject("suiteView",(List<String>)map.get("스위트뷰"));
		
		mv.addObject("css","adm/adm-rooms-list.css");
		mv.addObject("js","adm/adm-rooms.js");
		
		mv.setViewName("adm/adm-rooms-mainList");
		return mv;
		
    }
	
	@RequestMapping("/adm/rooms/list")
    public ModelAndView gotoAdmRoomsList(@RequestParam(value = "page", required=false, defaultValue = "1")int page, @RequestParam(value = "col", required=false) String col, @RequestParam(value = "kwd", required=false) String kwd) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("kwd",kwd);
		mv.addObject("col",col);
		mv.addObject("curPageNum",page);
		mv.addObject("css","adm/adm-rooms-list.css");
		mv.addObject("js","adm/adm-rooms.js");
		mv.setViewName("adm/adm-rooms-list");
		
		List<Rooms> rooms = null;
		//룸 리스트 가져오기
		BusinessResult br = roomAdmService.gotoAdmRoomsList(page, col, kwd);
		
		if(!(br.getCode()==RESULTCODE.정상)) {
			if(br.getCode()==RESULTCODE.존재하지않는검색결과) {//검색 결과가 없다면 리턴하기
				return mv;
			}
		}
		
		rooms = (List<Rooms>)br.getValue();
		
		Paging paging = pagingService.makeBlock(page);
		
		if(kwd == null) {//검색한 내용이 없다면 전체
			pagingService.makeLastPageNum(paging,"룸");
		}
		else {//있다면 필터
			pagingService.makeLastPageNum(paging,"룸",kwd,col);
		}
		
		int blockStartNum = paging.getBlockStartNum();
		int blockLastNum = paging.getBlockLastNum();
		int lastPageNum = paging.getLastPageNum();

		mv.addObject("curPageNum",page);
		mv.addObject("rooms", rooms);
		mv.addObject("blockStartNum", blockStartNum);
		mv.addObject("blockLastNum", blockLastNum);
		mv.addObject("lastPageNum", lastPageNum);
		return mv;
    }
	
	//객실등록준비
	@RequestMapping("/adm/rooms/write")
    public ModelAndView gotoAdmRoomWrite() {
		BusinessResult br = roomAdmService.gotoAdmRoomWrite();
		if(br.getCode() != RESULTCODE.정상) {}//차후에
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-rooms.css");
		mv.addObject("js","adm/adm-rooms.js");
		mv.setViewName("adm/adm-rooms-write");
		return mv;
    }
	//객실등록
	@RequestMapping("/adm/rooms/register")
	public ModelAndView registerRooms(RoomDetail roomDetail) {
		BusinessResult br = roomAdmService.registerRooms(roomDetail);
		if(br.getCode() != RESULTCODE.정상) {}//차후에
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-rooms.css");
		mv.addObject("js","adm/adm-rooms.js");
		mv.setViewName("redirect:/adm/rooms/write");
		return mv;
	}
	
	@RequestMapping("/adm/rooms/type-write")
    public ModelAndView gotoAdmRoomTypeWrite() {
		BusinessResult br = roomAdmService.gotoAdmRoomTypeWrite();
		if(br.getCode() != RESULTCODE.정상) {}//차후에
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-rooms.css");
		mv.addObject("js","adm/adm-rooms.js");
		mv.setViewName("adm/adm-rooms-typeWrite");
		return mv;
    }
	//
	@RequestMapping("/adm/rooms/typeRegister")
	public ModelAndView registerRoomType(RoomType roomType,@ModelAttribute RoomDetail roomDetail,HttpServletRequest request) {
		//룸 저장끝
		BusinessResult br = roomAdmService.registerRoomType(roomType,roomDetail,request);
		if(br.getCode() != RESULTCODE.정상) {}//차후에
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adm/rooms/mainList");
		return mv;
	}
	
	//adm-rooms-write 의 fnOption() ajax응답
	@ResponseBody
	@RequestMapping(value="/adm/rooms/room-option",method = RequestMethod.POST ,produces="text/plain;charset=utf-8")
	public String getRoomDetailsAdm(RoomDetail roomDetail) {
		BusinessResult br = roomAdmService.getRoomDetailsAdm(roomDetail);
		if(br.getCode() != RESULTCODE.정상) {}//차후에
		
		return (String)br.getValue();
	}
	
	
}
