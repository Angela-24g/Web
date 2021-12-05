package com.delluna.hotels.manage_rooms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.dataservice_reservation.ReservationAdmDAO;
import com.delluna.hotels.dataservice_reservation.RezAdmRoomTypeDAO;
import com.delluna.hotels.dataservice_rooms.IRoomDetailDAO;
import com.delluna.hotels.dataservice_rooms.IRoomTypeDAO;
import com.delluna.hotels.dataservice_rooms.IRoomsDAO;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Service("roomService")
public class RoomService implements IRoomService{
	@Autowired IRoomDetailDAO roomDetailDAO;
	@Autowired IRoomTypeDAO roomTypeDAO;
	@Autowired IRoomsDAO roomsDAO;
	@Autowired RezAdmRoomTypeDAO rezAdmRoomTypeDAO;
	@Autowired ReservationAdmDAO reservationAdmDAO;
	
	// 클라이언트단 뷰이동
	@Override
	public BusinessResult goRoomsList() {
		return new BusinessResult();
	}

	@Override
	public BusinessResult goRoomsSubTitle1() {
		return new BusinessResult();
	}

	@Override
	public BusinessResult goRoomsSubTitle2() {
		return new BusinessResult();
	}

	
	// 클라이언트단 - 예약관련
	
	// rez_adm_room_type 가져오기
	@Override
	public BusinessResult getRezRoomType(ReservationAdm reservationAdm) {
		// reservationAdm 으로 ajax 의 no 을 받기
		int no = reservationAdm.getRezAdm_no();
		String html = "";
		try {
			// 위 번호로 rezAdmRoomType 들을 가져오기
			List<RezAdmRoomType> rezAdmRoomTypes = rezAdmRoomTypeDAO.selectByRezAdmNo(no);
			
			html = "<div class=\"rsvtype type2\">\r\n<h2>상품 타입 선택</h2>\r\n" + "<div aria-live=\"polite\">\r\n";
			String title = null;
			String benefit = null;
			for(int i = 0; i < rezAdmRoomTypes.size(); i++) {
				
				RezAdmRoomType rezAdmRoomType = rezAdmRoomTypes.get(i);
				int roomType_no = rezAdmRoomType.getRoomType().getNo();
				title = rezAdmRoomType.getTitle();
				benefit = rezAdmRoomType.getBenefit();
				
				html +="<a href=\"#none\" onclick=\"fnOption("+ roomType_no +","+ no +",this)\">\r\n" + 
						"<div class=\"txt\" style=\"height: 216px;\">\r\n" + 
						"<strong><span class=\"type_tit\" id=\"type_tit"+roomType_no+"\">"+title+"</span></strong>\r\n" + 
						"<span class=\"sub type_content\" id=\"type_content"+roomType_no+"\">\r\n"+benefit+"</span>\r\n" + 
						"</div>\r\n"+
						"</a>\r\n";
			}
			html += "</div>\r\n"+"</div>";
			html += "<input type=\"hidden\" id=\"rezAdmRoomType_title\" name=\"title\" />";
			html += "<input type=\"hidden\" id=\"rezAdmRoomType_benefit\" name=\"benefit\" />";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new BusinessResult(html);
	}
	
	//room_type 전체 가져오기
	@Override
	public BusinessResult getRoomDetails(RezAdmRoomType rezAdmRoomType) {
		int no = rezAdmRoomType.getRoomType().getNo();
		String html = "";
		List<RoomDetail> roomDetails = null;
		List<RoomDetail> detailSetList = null;
		
		try {
			//룸타입 정보를 전부가져와 set하기
			RoomType roomType = roomTypeDAO.selecByNo(no);
			
			RoomDetail roomDetail = new RoomDetail();
			roomDetail.setRoomType(roomType);
			
			
			//룸타입에 따른 예약 가능 룸 확인( 없다면 false 이며 바로 return )
				
				//해당 룸타입의 뷰 꺼내기
				roomDetails = roomDetailDAO.selectView(roomDetail);
				
				html ="<input type=\"hidden\" id=\"room_type\" name=\"roomType.type\" value=\""+roomType.getType()+"\" />";
				html +="<div class=\"reservationBox\">\r\n<div class=\"choiceWrap\">\r\n<h2>객실 선택</h2>\r\n<dl>\r\n<dt>뷰 *</dt>\r\n<dd>\r\n";
				for(int i = 0; i < roomDetails.size(); i++) {
					html += "<div class=\"radioBox\">\r\n" + 
							"<input type=\"radio\" id=\"VIEWTYPE" + i + "\" name=\"room_view\" tabindex=\"0\" value=\"" + roomDetails.get(i).getRoom_view() + "\" onclick=\"fnCView();\">"+
							"<label for=\"VIEWTYPE" + i + "\">" + roomDetails.get(i).getRoom_view() + "</label>\r\n" + 
							"</div>\r\n";
				}
				
				//해당 룸타입의 위치 꺼내기
				roomDetails = roomDetailDAO.firstLocation(roomDetail);
				
				html += "</dd>\r\n</dl>\r\n<dl>\r\n<dt>위치 *</dt>\r\n<dd id=\"locationRadio\">\r\n";
				for(int i = 0; i < roomDetails.size(); i++) {
					html += "<div class=\"radioBox\">\r\n" + 
							"<input type=\"radio\" id=\"LOCATION" + i + "\" name=\"room_location\" tabindex=\"0\" value=\"" + roomDetails.get(i).getRoom_location() + "\" disabled=\"disabled\">" +
							"<label for=\"LOCATION" + i + "\">" + roomDetails.get(i).getRoom_location() + "</label>\r\n" +
							"</div>\r\n";
				}
				
				//해당 룸타입의 베드타입 꺼내기		
				roomDetails = roomDetailDAO.firstBedtype(roomDetail);
				
				html += "</dd>\r\n</dl>\r\n<dl>\r\n<dt>타입 *</dt>\r\n<dd id=\"bedRadio\">\r\n"; 
				for(int i = 0; i < roomDetails.size(); i++) {
					html += "<div class=\"radioBox\">\r\n" + 
							"<input type=\"radio\" id=\"BEDTYPE" + i + "\" name=\"room_bedtype\" tabindex=\"0\" value=\"" + roomDetails.get(i).getRoom_bedtype() + "\" disabled=\"disabled\">\r\n" + 
							"<label for=\"BEDTYPE" + i + "\">" + roomDetails.get(i).getRoom_bedtype() + "</label>\r\n" + 
							"</div>\r\n";
				}
		
						
				html += "</dd>\r\n</dl>\r\n</div>\r\n<div class=\"choiceWrap add\">\r\n<dl>\r\n<dt>추가베드 *</dt>\r\n<dd>\r\n<input type=\"hidden\" id=\"bedPrice\" name=\"price_bed\" value=\"0\">\r\n" + 
				"<div class=\"radioBox\">\r\n<input type=\"radio\" id=\"extraBed1\" name=\"price_bed\" tabindex=\"0\" value=\"Y\"onclick=\"fnRoomChange(72600);\">"+
				"<label for=\"extraBed1\"><span class=\"_bad\">엑스트라베드</span> (+ 72,600원)</label>\r\n" + 
				"</div>\r\n" + 
				"<div class=\"radioBox\">\r\n<input type=\"radio\" id=\"extraBed2\" name=\"price_bed\" tabindex=\"0\" value=\"N\" checked=\"checked\" onclick=\"fnRoomChange(0);\">"+
				"<label for=\"extraBed2\">선택 안함</label>\r\n" + 
				"</div>\r\n" + 
				"</dd>\r\n</dl>\r\n</div>\r\n" + 
				"<div class=\"cautionBox\">\r\n<ul class=\"dotList\">\r\n<li>추가베드 (본관: 엑스트라 베드 / 신관: 소파베드 메이킹) 이용시, 오션스파 씨메르 &amp; 풀 1회 무료, 실내 사우나 50% 할인 혜택(1회 한정) 제공.</li>\r\n" + 
				"<li>13세 이하 어린이의 경우 별도 요금없이 객실당 2명까지 투숙 가능합니다. (단, 성인 3인 투숙시 어린이 1명 투숙가능)</li>\r\n<li>단, 패키지 전용 혜택은 제외됩니다.</li>\r\n</ul>\r\n" + 
				"</div>\r\n</div>";
				html += "<div class=\"reservationAside\">\r\n" + 
						"<section class=\"reservationSection\">\r\n" + 
						"<div class=\"productWrap\">\r\n" + 
						"<div class=\"productPrice\">\r\n" + 
						"<dl>\r\n<dt>상품요금\r\n</dt>\r\n" + 
						"<dd id=\"pkrw\">0원</dd>\r\n" + 
						"</dl>\r\n" + 
						"<dl>\r\n<dt>세금 및 봉사료\r\n<a href=\"#\" class=\"tooltipLink\">툴팁</a>\r\n" + 
						"<div class=\"tooltipBox\">\r\n<p>10%봉사료 추가 후 10% 세금이 더해집니다.</p>\r\n</div>\r\n" + 
						"</dt>\r\n<dd id=\"tkrw\">0원</dd>\r\n</dl>\r\n<dl>\r\n<dt>추가베드</dt>\r\n" + 
						"<dd id=\"bkrw\">0원</dd>\r\n"+
						"</dl>\r\n"+
						"<dl>\r\n<dt>추가옵션</dt>\r\n<dd id=\"okrw\">0원</dd>\r\n</dl>\r\n" + 
						"</div>\r\n</div>\r\n" + 
						"<div class=\"productTotal\">\r\n<dl>\r\n<dt>최종 금액</dt>\r\n" + 
						"<dd><span id=\"totalkrw\">0</span>원</dd>\r\n</dl>\r\n</div>\r\n" + 
						"<a href=\"#none\" onclick=\"msgpopup()\" class=\"btn btnFull layerPopOpen\"><span>다음</span></a>\r\n" + 
						"</section>\r\n</div>";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new BusinessResult(html);
	}

	//'뷰' 선택시
	@Override
	public BusinessResult getLocation(RoomDetail roomDetail) {
		List<RoomDetail> detailList = new ArrayList<RoomDetail>();
		
		detailList = roomDetailDAO.selectLocation(roomDetail);
		
		List<String> locations = new ArrayList<String>();
		for(RoomDetail rd : detailList) {
			locations.add(rd.getRoom_location());
		}
		return new BusinessResult(locations);
	}

	//'위치' 선택시
	@Override
	public BusinessResult getBedtype(RoomDetail roomDetail) {
		List<RoomDetail> detailList = new ArrayList<RoomDetail>();
		
		detailList = roomDetailDAO.selectBedtype(roomDetail);
		
		List<String> bedtypes = new ArrayList<String>();
		for(RoomDetail rd : detailList) {
			bedtypes.add(rd.getRoom_bedtype());
		}
		return new BusinessResult(bedtypes);
	}

	//'베드타입' 선택시
	@Override
	public BusinessResult getPrice(RoomDetail roomDetail,ReservationAdm reservationAdm) {
		
		RoomDetail getPriceRoomDetail = roomDetailDAO.selectNoPrice(roomDetail);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		
		//마지막 베드타입 선택시 해당하는 옵션의 객실이 있는지 여부
		if(roomsDAO.isInRoomsLast(getPriceRoomDetail.getRoomdetail_no(), "예약대기")) {
			//가격 , 할인율 계산
			int price = getPriceRoomDetail.getRoom_price();
			
			ReservationAdm rezAdmForRate = reservationAdmDAO.findByNoAddView(reservationAdm.getRezAdm_no(), false);
			double rate = rezAdmForRate.getPkg_rate();
			//할인할 가격
			double forRate = (double)price*rate;
			//천단위 부분 버리기
			int price_product = price - (int)(Math.ceil(forRate / 10000) * 10000);
			
			//세금,서비스 가격 계산
			double service = 0.21;//세율+서비스율
			double forService = (double)price_product * service;
			int price_service = (int)(Math.ceil(forService/100)*100);
			
			map.put("price_product",price_product);
			map.put("price_service",price_service);
			map.put("roomdetail_no",getPriceRoomDetail.getRoomdetail_no());
			
			return new BusinessResult(map);
		}else {
			map.put("price_product", 0);
			return new BusinessResult(map);
		}
		
	}

	
}
