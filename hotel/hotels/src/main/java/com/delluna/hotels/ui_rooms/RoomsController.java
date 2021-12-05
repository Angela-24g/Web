package com.delluna.hotels.ui_rooms;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.manage_rooms.IRoomService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class RoomsController {
	@Autowired @Qualifier("roomService") IRoomService roomSerivce;

	@RequestMapping(value="/rooms")
	public ModelAndView goRoomsList(){
		BusinessResult br = roomSerivce.goRoomsList();
		
		ModelAndView mv = new ModelAndView();

		mv.setViewName("rooms/rooms-list");
		mv.addObject("css","rooms/rooms.css");
		mv.addObject("js","rooms/rooms-list.js");

		return mv;
	}
	
	//category = deluxe, premium deluxe, sweet (common_subHeader 에 노출됨, 풀네임)
	//subtype = 줄임말 가능
	@RequestMapping("/rooms/{category}")
	public ModelAndView goRoomsSubTitle1(@PathVariable String category){
		BusinessResult br = roomSerivce.goRoomsSubTitle1();
		
		ModelAndView mv = new ModelAndView();
		category=category.replaceAll(" ", "");
		
		//각각 디럭스,프리미엄디럭스,스위트
		if(category.equals("deluxe")) {
			String subcategory="city";
			mv.setViewName("/rooms/"+category+"-"+subcategory);
			
		}else if(category.equals("premiumdeluxe")){
			String subcategory="double-new";
			mv.setViewName("/rooms/"+category+"-"+subcategory);
			
		}else if(category.equals("suite")){
			String subcategory="city";
			mv.setViewName("/rooms/"+category+"-"+subcategory);
		}
		
		mv.addObject("css","rooms/rooms.css");
		mv.addObject("js","rooms/rooms-list.js");
		
		return mv;
	}
	
	@RequestMapping("/rooms/{category}/{subcategory}")
	public ModelAndView goRoomsSubTitle2(@PathVariable String category,@PathVariable String subcategory){
		BusinessResult br = roomSerivce.goRoomsSubTitle2();
		
		ModelAndView mv = new ModelAndView();
		category=category.replaceAll(" ", "");
		
		
		mv.setViewName("/rooms/"+category+"-"+subcategory);
		mv.addObject("css","rooms/rooms.css");
		mv.addObject("js","rooms/rooms-list.js");
		
		return mv;
	}
	
	//fnMappingView() - ReservationAdm 의 번호로 rez_adm_room_type 가져오기
	@ResponseBody
	@RequestMapping(value="/reservation/rsv-mapping",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String getRezRoomType(ReservationAdm reservationAdm) {
		BusinessResult br = roomSerivce.getRezRoomType(reservationAdm);
		String html = (String)br.getValue();
		
		return html;
	}
	
	//fnOption() - 위에서 room_type 번호를 폼에 남겨 해당 메서드가 전송
	//그 번호로 room_type + room_detail 가져오기
	@ResponseBody
	@RequestMapping(value="/reservation/rsv-option",method=RequestMethod.POST ,produces="text/plain;charset=utf-8")
	public String getRoomDetails(RezAdmRoomType rezAdmRoomType) {
		BusinessResult br = roomSerivce.getRoomDetails(rezAdmRoomType);
		if (br.getCode() == RESULTCODE.예약가능룸비존재) {
			return br.getMessage();
		}
		String html = (String)br.getValue();
		return html;
	}
	
	//fnCView() - 뷰 라디오버튼에 달린 함수
	@ResponseBody
	@RequestMapping(value="/reservation/rsv-view",method=RequestMethod.POST)
	public List<String> getLocation(RoomDetail roomDetail) {
		BusinessResult br = roomSerivce.getLocation(roomDetail);
		
		List<String> locationDetails = (List<String>)br.getValue();
        return locationDetails;
	}
	
	//fnTView() - 위치 라디오버튼에 달린 함수
	@ResponseBody
	@RequestMapping(value="/reservation/rsv-location",method=RequestMethod.POST)
	public List<String> getBedtype(RoomDetail roomDetail) {
		BusinessResult br = roomSerivce.getBedtype(roomDetail);
		
		List<String> bedtypeDetails = (List<String>)br.getValue();
		return bedtypeDetails;
	}
	//fnRoomSelect() - 베드타입 라디오버튼에 달린 함수
	@ResponseBody
	@RequestMapping(value="/reservation/rsv-bedtype",method=RequestMethod.POST)
	public HashMap<String,Integer> getRooms(RoomDetail roomDetail,ReservationAdm reservationAdm) {
		//원래 jsp에서 input.name=no은 reservation_adm 껀데 다 가지게 되버림(차후 수정요망..)
		BusinessResult br = roomSerivce.getPrice(roomDetail,reservationAdm);
		return (HashMap<String,Integer>)br.getValue();
	}
}
