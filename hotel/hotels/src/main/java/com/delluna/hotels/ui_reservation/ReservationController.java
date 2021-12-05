package com.delluna.hotels.ui_reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_point.PointDetail;
import com.delluna.hotels.common_point.PointEvent;
import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.Rooms;
import com.delluna.hotels.dataservice_member.IMemberMapper;
import com.delluna.hotels.dataservice_point.IPointDetailDAO;
import com.delluna.hotels.dataservice_point.IPointEventDAO;
import com.delluna.hotels.dataservice_reservation.IReservationAdmDAO;
import com.delluna.hotels.dataservice_reservation.IReservationDAO;
import com.delluna.hotels.dataservice_rooms.RoomsDAO;

@Controller
public class ReservationController {
	@Autowired
	IReservationAdmDAO reservationAdmDAO;
	@Autowired
	IReservationDAO reservationDAO;
	@Autowired
	IPointEventDAO pointEventDAO;
	@Autowired
	RoomsDAO roomsDAO;
	@Autowired
	IMemberMapper memberMapper;
	@Autowired
	IPointDetailDAO pointDetailDAO;

	@GetMapping("/reservation")
	public ModelAndView gotoRsvList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("no")!=null) {
			int no = (Integer)session.getAttribute("no");
			mv.addObject("member_no", no);
		}
		mv.addObject("css", "reservation/reservation.css");
		mv.addObject("js", "reservation/reservation.js");
		mv.setViewName("reservation/reservation-list");
		return mv;
	}

	@RequestMapping(value = "/reservation-list")
	public ModelAndView searchRsvList(@RequestParam String check_in, @RequestParam String check_out,
			@RequestParam String search_abult, @RequestParam String search_elementary,
			@RequestParam String search_child, @RequestParam String search_baby,HttpSession session) {
		// test
		// int memberNo = 1;
		List<ReservationAdm> rsvByDateList = reservationAdmDAO.selectByDate(check_in, check_out);
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("no")!=null) {
			int no = (Integer)session.getAttribute("no");
			mv.addObject("member_no", no);
		}
		mv.addObject("rsvByDateList", rsvByDateList);
		mv.addObject("check_in", check_in);
		mv.addObject("check_out", check_out);
		mv.addObject("search_abult", search_abult);
		mv.addObject("search_elementary", search_elementary);
		mv.addObject("search_child", search_child);
		mv.addObject("search_baby", search_baby);
		mv.addObject("css", "reservation/reservation.css");
		mv.addObject("js", "reservation/reservation.js");
		mv.setViewName("reservation/reservation-list");
		return mv;
	}

	// ******************************************************//
	// RoomsController.java - 지혜님작업 //
	// "/reservation/rsv-mapping", "/reservation/getWingType"//
	// ******************************************************//

	@RequestMapping("/reservation-reserve")
	public ModelAndView gotoRsvReserve(HttpSession session, Reservation reservation, ReservationAdm reservationAdm,
		RezAdmRoomType rezAdmRoomType, RoomDetail roomDetail) {
		// list내의 mapping(type), option에서 선택한 게시물 옵션이
		// reserve로 넘어가야함.
		ModelAndView mv = new ModelAndView();
		// 사용자가 선택한 옵션들
		mv.addObject("check_in", reservation.getCheck_in());
		mv.addObject("check_out", reservation.getCheck_out());
		mv.addObject("room_count", reservation.getRoom_count());
		mv.addObject("count_adult", reservation.getCount_adult());
		mv.addObject("count_elementary", reservation.getCount_elementary());
		mv.addObject("count_child", reservation.getCount_child());
		mv.addObject("count_baby", reservation.getCount_baby());
		mv.addObject("price_product", reservation.getPrice_product());
		mv.addObject("price_service", reservation.getPrice_service());
		mv.addObject("price_bed", reservation.getPrice_bed());
		mv.addObject("price_options", reservation.getPrice_options());
		mv.addObject("price_total", reservation.getPrice_total());

		// 예약 저장시 예약상품번호
		mv.addObject("rezAdm_no", reservationAdm.getRezAdm_no());

		// 예약가능상품의 타입옵션들
		mv.addObject("title", rezAdmRoomType.getRezAdm().getTitle());
		mv.addObject("type_title", rezAdmRoomType.getTitle());
		mv.addObject("type_benefit", rezAdmRoomType.getBenefit());
		// 예약 저장시 룸 찾아오기위한 RoomDetail 번호
		mv.addObject("roomdetail_no", roomDetail.getRoomdetail_no());
		mv.addObject("room_type", roomDetail.getRoomType().getType());
		mv.addObject("room_view", roomDetail.getRoom_view());
		mv.addObject("room_location", roomDetail.getRoom_location());
		mv.addObject("room_bedtype", roomDetail.getRoom_bedtype());

		Rooms room = roomsDAO.selectByRoomDtNo(roomDetail.getRoomdetail_no(), "예약대기");

		mv.addObject("rooms_no", room.getNo());
		// 회원이면??
		//if(session.getAttribute("no")!=null) {}
		int writerNo = (int) session.getAttribute("no");
		Member member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		mv.addObject("writer_no", writerNo);
		mv.addObject("member", member);

		// 포인트 결제를 위해 1:토탈, 2:사용된 //토탈-사용된=사용가능 포인트
		int before_use = pointEventDAO.totalPoint(writerNo, 0);
		mv.addObject("before_use", before_use);// 사용하기 전 포인트

		// css js viewLocation
		mv.addObject("css", "reservation/reservation.css");
		mv.addObject("js", "reservation/reserve.js");
		mv.setViewName("reservation/reservation-reserve");
		return mv;
	}

	@RequestMapping(value = "/reservation-update", method = RequestMethod.POST)
	   public ModelAndView gotoRsvUpdate(@ModelAttribute Reservation reservation, HttpSession session) {
	      reservationDAO.save(reservation);
	      // rooms의 방 예약 상태 변경 (UPDATE)
	      int rooms_no = reservation.getRooms_no().getNo();
	      roomsDAO.updateState(rooms_no, "예약중");

	      int willSavePoint = (int) ((reservation.getPrice_result()) * 0.03);
	      Member member = memberMapper.findByNo((Integer) session.getAttribute("no"));

	      // 포인트이벤트 의 정보를 담음
	      PointEvent pointEvent = new PointEvent();
	      pointEvent.setReservation_no(reservation);// 예약
	      pointEvent.setMember_no(member);// 맴버
	      pointEvent.setAmount(willSavePoint);// 포인트양

	      // 성공시 고유키반환 실패시 -1반환
	      int 포인트이벤트고유키 = pointEventDAO.save(pointEvent);

	      // 포인트디테일 정보를 담음
	      PointDetail pointDetail = new PointDetail();
	      pointDetail.setMember_no(member.getNo());// 맴버 넘버
	      pointDetail.setAmount(willSavePoint);// 포인트양

	      // 키값이 -1(실패)가 아니라면 담아줌
	      if (포인트이벤트고유키 != -1) {
	         pointDetail.setPointEventNo(pointEventDAO.findByNo(포인트이벤트고유키, 1));
	      }

	      // 포인트디테일 적립 성공시 1반환
	      int 성공여부Save = pointDetailDAO.save(pointDetail);

	      if (성공여부Save == -1) {
	         // 오류 메세지
	         return null;
	      }

	      ModelAndView mv = new ModelAndView();
	      // pointEvent발생 지불영역
	      Reservation rv = reservation;// 예약정보를 담음
	      Member writer = reservation.getWriter(); // 맴버 정보
	      int willUsePoint = reservation.getPrice_point();// 사용할 포인트
	      if (willUsePoint != 0) {// 포인트를 사용 할거라면
	         pointEvent.setReservation_no(rv);// 예약
	         pointEvent.setMember_no(writer);// 맴버
	         pointEvent.setAmount(-(willUsePoint));// 포인트양

	         if (pointEventDAO.totalPoint(writer.getNo(), 0) > willUsePoint) {// 남은 잔액이 사용금액보다 클때

	            // 성공시 고유키반환 실패시 -1반환
	            int 성공여부1 = pointEventDAO.pay(pointEvent);

	            // 포인트디테일 사용 성공시 1반환
	            int 성공여부 = pointDetailDAO.pay((Integer) session.getAttribute("no"), willUsePoint);

	            if (성공여부 == -1 || 성공여부1 == -1) {
	               // 실패시 오류 메세지
	               mv.addObject("msg", "예약에 실패 하였습니다.");
	               mv.addObject("script", "history.back()");
	               mv.setViewName("/mypage/pointpay");
	               return mv;
	            }

	            mv.addObject("msg", "예약이 완료되었습니다.");
	            mv.addObject("name", session.getAttribute("name"));
	            List<Reservation> rvL = reservationDAO.selectAllByMemberNo((Integer) session.getAttribute("no"));
	            mv.addObject("rvL", rvL);
	            mv.addObject("css", "mypage/reservation.css");
	            mv.setViewName("/mypage/reservation");
	            return mv;

	         } else {// 남은 잔액이 사용금액보다 작을 때 : 사용불가
	            mv.addObject("msg", "포인트 잔액이 부족합니다.");
	            mv.addObject("script", "history.back()");
	            mv.setViewName("/mypage/pointpay");
	            return mv;
	         }
	      }
	      mv.addObject("msg", "예약이 완료되었습니다.");
	      mv.addObject("name", session.getAttribute("name"));
	      List<Reservation> rvL = reservationDAO.selectAllByMemberNo((Integer) session.getAttribute("no"));
	      mv.addObject("rvL", rvL);
	      mv.addObject("css", "mypage/reservation.css");
	      mv.setViewName("/mypage/reservation");
	      return mv;
	   }
}