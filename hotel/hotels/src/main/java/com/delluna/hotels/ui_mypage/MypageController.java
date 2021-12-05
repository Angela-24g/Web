package com.delluna.hotels.ui_mypage;



import java.sql.Date;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;
import com.delluna.hotels.common_point.PointEvent;
import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.dataservice_member.IMemberMapper;
import com.delluna.hotels.dataservice_notice.IQnaMapper;
import com.delluna.hotels.dataservice_point.IPointDetailDAO;
import com.delluna.hotels.dataservice_point.IPointEventDAO;
import com.delluna.hotels.dataservice_reservation.IReservationDAO;
import com.delluna.hotels.dataservice_restaurants.IRestaurantsMapper;

@Controller
public class MypageController {
	
	@Autowired IPointEventDAO pointEventDAO;
	@Autowired IPointDetailDAO pointDetailDAO;
	@Autowired IMemberMapper memberMapper;
	@Autowired IReservationDAO reservationDAO;
	@Autowired IRestaurantsMapper restaurantsMapper;
	@Autowired IQnaMapper qnaMapper;

	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		
		int memberNo = (Integer)session.getAttribute("no");
		Member member = memberMapper.findByNo(memberNo);
		List<Restaurants> rtL = restaurantsMapper.selectAllByMemberNo((Integer)session.getAttribute("no"));
		List<Reservation>  rvL = reservationDAO.selectAllByMemberNo((Integer)session.getAttribute("no"));
		List<Qna> qnaList = qnaMapper.selectAll(memberNo);
		
		int remainPoint = pointEventDAO.totalPoint(memberNo, 0);
		int soonExpirePoint = pointDetailDAO.soonExpireAmount(memberNo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/mypage");
		mv.addObject("remainPoint", remainPoint);
		mv.addObject("soonExpirePoint", soonExpirePoint);
		mv.addObject("css", "mypage/mypage.css");
		mv.addObject("rtL", rtL);
		mv.addObject("rvL", rvL);
		mv.addObject("qnaList", qnaList);
		
		mv.addObject("name", member.getName());
		mv.addObject("no", session.getAttribute("no"));
		
		return mv;
	}
	//----------------------------------------------------------------------------------------------------------이 부분은 비회원하고 지우겠습니다.-------------------------------------------------------------
	@GetMapping("/mypage/reservation")
	public ModelAndView mypageReservation(HttpSession session) {
		List<Reservation>  rvL = reservationDAO.selectAllByMemberNo((Integer)session.getAttribute("no"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservation");
		mv.addObject("name", session.getAttribute("name"));
		mv.addObject("rvL", rvL);
		
		mv.addObject("css", "mypage/reservation.css");
		
		return mv;
	} 
	 
	@GetMapping("/mypage/reservationCheck/{no}")
	public ModelAndView mypageReservationCheck(@PathVariable("no") int no, HttpSession session) {
		
		Reservation rv = reservationDAO.findByNo(no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationCheck");
		mv.addObject("rv", rv);
		
		mv.addObject("css", "mypage/reservationDin.css");
		
		return mv;
	}
	
	@GetMapping("/mypage/reservationCheck/delete/{no}")
	public ModelAndView mypageReservationDelete(@PathVariable int no ,HttpSession session) {
		String msg = "오류가 발생하였습니다. 다시 시도해주세요";
		String script = "location.href = '/index'";
			
		
		if(no != 0) {
		reservationDAO.updateState("예약취소", no);
		msg = "예약이 취소되었습니다.";
		script = "location.href = '/mypage/reservation'";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		
		return mv;
	}
	
	@GetMapping("/mypage/reservationBox")
	public ModelAndView mypageReservationBox(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationBox");
		mv.addObject("name", session.getAttribute("name"));
		
		mv.addObject("css", "mypage/reservationBox.css");
		
		return mv;
	}
	
	@GetMapping("/mypage/reservationDin")
	public ModelAndView mypageReservationDin(HttpSession session) {
	/*	List<Restaurants> rtL = restaurantsMapper.selectAllByMemberNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationDin");
		mv.addObject("rtL", rtL);
		
		mv.addObject("css", "mypage/reservationDin.css");
		
		return mv;*/
		if(session.getAttribute("no")==null)
		{
			
			String uname = (String)session.getAttribute("uname");
			String utel = (String)session.getAttribute("utel");
			List<RestaurantsNon> rtL = restaurantsMapper.selectNonAll(uname, utel);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/mypage/reservationDin");
			mv.addObject("rtL", rtL);
			
			mv.addObject("css", "mypage/reservationDin.css");
			
			return mv;
		}
		List<Restaurants> rtL = restaurantsMapper.selectAllByMemberNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationDin");
		mv.addObject("rtL", rtL);
		
		mv.addObject("css", "mypage/reservationDin.css");
		
		return mv;
	}
	
	@GetMapping("/mypage/reservationDinCheck/{no}")
	public ModelAndView mypageReservationDinCheck(@PathVariable int no ,HttpSession session) {
		
	/*	Restaurants rt = restaurantsMapper.findByNo(no);
		Member member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationDinCheck");
		mv.addObject("rt", rt);
		mv.addObject("member", member);
		
		mv.addObject("css", "mypage/reservationDin.css"); 
		
		return mv;*/
		if(session.getAttribute("no")==null)
		{	
			String uname = (String)session.getAttribute("uname");
			String utel = (String)session.getAttribute("utel");
			RestaurantsNon rt = restaurantsMapper.selectNonall(uname, utel);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/mypage/reservationDinCheck");
			mv.addObject("rt", rt);
			
			mv.addObject("css", "mypage/reservationDin.css"); 
			
			return mv;
		}
		else {
			Restaurants rt = restaurantsMapper.findByNo(no);
		
		Member member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/reservationDinCheck");
		mv.addObject("rt", rt);
		mv.addObject("member", member);
		
		mv.addObject("css", "mypage/reservationDin.css"); 
		
		return mv;
		}
	}
	
	@GetMapping("/mypage/reservationDinCheck/delete/{no}")
	public ModelAndView mypageReservationDinDelete(@PathVariable int no ,HttpSession session) {
		String msg = "오류가 발생하였습니다. 다시 시도해주세요";
		String script = "location.href = '/index'";
		String state = "예약취소";
		
		if(no != 0) {
		restaurantsMapper.updateRt(state, no);
		msg = "예약이 취소되었습니다.";
		script = "location.href = '/mypage/reservationDin'";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		
		return mv;
	}
	//바로 내역 조회하는거라 Post
			@PostMapping("/mypage/reservationDinNon")
			public ModelAndView nonmypageReservationDin(HttpSession session)
			{			
					String uname = (String)session.getAttribute("uname");
					String utel = (String)session.getAttribute("utel");
					List<RestaurantsNon> rtL = restaurantsMapper.selectNonAll(uname,utel);
					
					ModelAndView mv = new ModelAndView();
					mv.addObject("rtL", rtL);
					mv.addObject("css", "mypage/reservationDin.css");
					mv.setViewName("/mypage/reservationDin");
					return mv;
			}
	// ----------------------------------------------------------------------------------------------------------------------res--------------------------------------------------------------------
	@GetMapping("/mypage/point")
	public ModelAndView mypagePoint(HttpServletRequest request,HttpSession session) {
		
		int member = (Integer)session.getAttribute("no");
				
		//변수들 모음
		String col = "all";
		Date startDate = null;
		Date endDate = null;
		int totalPoint = pointEventDAO.totalPoint(member, 1);
		int usedPoint = -(pointEventDAO.totalPoint(member, 2));
		int remainPoint = pointEventDAO.totalPoint(member, 0);
		int soonExpirePoint = pointDetailDAO.soonExpireAmount(member);
		if(request.getParameter("col") != null) {
			col = request.getParameter("col");
		}
				
		//입장시 만료시키기
		pointDetailDAO.expired(member); 
		pointEventDAO.expired(member);
				
		ModelAndView mv = new ModelAndView();
		//날짜를 이런식으로 만들어라 라는 뜻(형태를 잡아줌)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
		//날짜가 지정이 안되있으면 날짜값을 안줌
		try {
			if(request.getParameter("startDate") != "") {
				startDate = new Date(sdf.parse(request.getParameter("startDate")).getTime());
			}
			if(request.getParameter("endDate") != "") {
				endDate = new Date(sdf.parse(request.getParameter("endDate")).getTime());
			}
			if(startDate!=null && endDate!=null) {
				mv.addObject("startDate", startDate);
				mv.addObject("endDate", endDate);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}
				
				//리스트 출력
		List<PointEvent> pointList = null;
		if(!pointEventDAO.pointList(member,col,startDate,endDate).isEmpty()) {
			pointList = pointEventDAO.pointList(member,col,startDate,endDate);
			mv.addObject("pointList", pointList);
		}
				
				//값들 보냄
		mv.setViewName("/mypage/point");
		mv.addObject("css", "mypage/point.css");
		
		mv.addObject("totalPoint", totalPoint);
		mv.addObject("usedPoint", usedPoint);
		mv.addObject("remainPoint", remainPoint);
		mv.addObject("soonExpirePoint", soonExpirePoint);
		mv.addObject("col", col);
				
				
		return mv;
	}
	
	@GetMapping("/mypage/pointExchange")
	public ModelAndView mypagePointExchange(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/pointExchange");
		mv.addObject("name", session.getAttribute("name"));
		
		mv.addObject("css", "mypage/pointExchange.css");
		
		return mv;
	}
	
	@GetMapping("/mypage/service")
	public ModelAndView mypageVoc(HttpSession session) {
		List<Qna> qnaList = qnaMapper.selectAll((Integer)session.getAttribute("no"));
		Member member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/voc");
		mv.addObject("member", member);
		mv.addObject("qnaList", qnaList);
		
		mv.addObject("css", "mypage/voc.css");
		mv.addObject("js", "mypage/voc.js");
		
		return mv;
	}
	
	@GetMapping("/mypage/service/{no}")
	public ModelAndView mypageVocView(@PathVariable int no,HttpSession session) {
		Qna qna = qnaMapper.findByNo(no);
		Qnares qnares = qnaMapper.findByQno(qna.getNo());
		Member member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/vocView");
		mv.addObject("member", member);
		mv.addObject("qna", qna);
		mv.addObject("qnares", qnares);
		
		mv.addObject("css", "mypage/voc.css");
		mv.addObject("js", "mypage/voc.js");
		
		return mv;
	}
	
	@GetMapping("/mypage/service/delete/{no}")
	public ModelAndView mypageVocDelete(@PathVariable int no,HttpSession session) {
		String msg = "오류가 발생하였습니다. 다시 시도해주세요";
		String script = "location.href = '/index'";
		
		if(no != 0) {
			qnaMapper.delete(no);
			msg = "질문이 삭제되었습니다.";
			script = "location.href = '/mypage/service'";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberCheck");	
		mv.addObject("css", "mypage/voc.css");
		mv.addObject("js", "mypage/voc.js");
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		
		return mv;
	}
	
	@PostMapping("/mypage/service")
	public ModelAndView mypageVocSave(Qna qna, HttpSession session) {
		qna.setWriter(memberMapper.findByNo((Integer)session.getAttribute("no")));
		int check = qnaMapper.save(qna);
		
		ModelAndView mv = new ModelAndView();
		if(check != 0) {
			mv.addObject("msg", "오류가 발생하였습니다.");
			mv.addObject("script", "history.back();");
		}
		
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("msg", "문의가 등록되었습니다.");
		mv.addObject("script", "location.href = '/mypage/service'");
		mv.addObject("css", "mypage/voc.css");
		mv.addObject("js", "mypage/voc.js");
		
		return mv;
	}
	
	@GetMapping("/mypage/edit")
	public ModelAndView mypageValidationPwd(HttpSession session) {
		
		Member member = null;
		member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberEdit");
		mv.addObject("member", member);
		
		mv.setViewName("/mypage/validationPwd");
		mv.addObject("css", "mypage/validationPwd.css");
		
		return mv;
	}
	
	@PostMapping("/mypage/edit")
	public ModelAndView mypageValidationPwdCheck(HttpServletRequest request, HttpSession session) {
		String msg = "비밀번호가 틀렸습니다."; 
		String script = "history.back()";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
				
		boolean isin = memberMapper.isIn(id, pw,"가입",1);
		
		
		if(isin != false){
			script = "location.href='/mypage/edit/check'";
			msg = "확인되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("name", session.getAttribute("name"));
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		//테스트코드 시작
		mv.addObject("id", "TestID");
		//테스트코드 끝
		
		mv.addObject("css", "mypage/validationPwd.css");
		
		return mv;
	}
	
	@GetMapping("/mypage/edit/check")
	public ModelAndView mypageMemberEditReady(HttpSession session) {
		Member member = null;
		member = memberMapper.findByNo((Integer)session.getAttribute("no"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberEdit");
		mv.addObject("member", member);
		
		mv.addObject("css", "mypage/validationPwd.css");
		mv.addObject("js", "mypage/edit.js");
		
		return mv;
	}
	
	@PostMapping("/mypage/edit/check/complete")
	public ModelAndView mypageMemberEdit(Member member, HttpSession session) {
		String msg = "데이터 오류가 발생하였습니다. 다시 시도해주세요";
		String script = "location.href='/index'";

		if(member != null){
			memberMapper.updateMypage(member);
			msg = "회원정보가 수정되었습니다.";
			script = "location.href='/mypage'";
		} 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		
		return mv;
	}
	
	@GetMapping("/mypage/delete")
	public ModelAndView mypageMemberDropReady(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/memberDrop");
		mv.addObject("name", session.getAttribute("name"));
		
		mv.addObject("css", "mypage/memberDrop.css");
		
		return mv;
	}
	
	@PostMapping("/mypage/delete")
	public ModelAndView mypageMemberDropCheck(HttpServletRequest request, HttpSession session) {
		String msg = "존재하지 않은 아이디거나 비밀번호가 틀렸습니다."; 
		String script = "history.back()";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
				
		boolean isin = memberMapper.isIn(id,pw,"가입",1);
		
		ModelAndView mv = new ModelAndView();
		
		if(isin != false){
			mv.setViewName("/mypage/memberCheck");
			msg = "확인되었습니다.";
			script = "location.href='/mypage/delete/complete'";
		}
		else {
			mv.setViewName("/mypage/memberCheck");
		}
		
		mv.addObject("msg",msg);
		mv.addObject("script",script);
		
		
		return mv;
	}
	
	@PostMapping("/mypage/delete/complete")
	public ModelAndView mypageMemberDrop(HttpServletRequest request, HttpSession session) {
		String msg = "탈퇴 되었습니다.";
		String script = "location.href='/index'";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
				
		boolean isin = memberMapper.isIn(id,pw,"가입",1);
		
		ModelAndView mv = new ModelAndView();
		
		if(isin != false){
			int member_no = (Integer)session.getAttribute("no");
			memberMapper.approvalAdm("탈퇴", member_no);
			session.invalidate();
		}
		else {
			mv.setViewName("/mypage/delete");
			msg = "존재하지않은 아이디거나 비밀번호가 틀렸습니다.";
			script = "history.back();";
		}
		
		mv.setViewName("/mypage/memberCheck");
		mv.addObject("msg", msg);
		mv.addObject("script", script);
		
		return mv;
	}
	
	//적립 테스트
	@GetMapping("/pointsave")
    public ModelAndView test(HttpSession session) {
		
	//예약정보를 담음
	Reservation rv = reservationDAO.findByRsvNo(1);
	System.out.println(rv);
	
	//맴버 정보를 담음
	Member member =  memberMapper.findByNo((Integer)session.getAttribute("no"));

	//포인트이벤트 의 정보를 담음
	PointEvent pointEvent = new PointEvent();
	pointEvent.setReservation_no(rv);//예약
	pointEvent.setMember_no(member);//맴버
	pointEvent.setAmount(3000);//포인트양
	
	//성공시 고유키반환 실패시 -1반환
	int 포인트이벤트고유키 = pointEventDAO.save(pointEvent);
	
	//포인트디테일 정보를 담음
	com.delluna.hotels.common_point.PointDetail pointDetail = new com.delluna.hotels.common_point.PointDetail();
	pointDetail.setMember_no(member.getNo());//맴버 넘버
	pointDetail.setAmount(3000);//포인트양
	
	//키값이 -1(실패)가 아니라면 담아줌
	if(포인트이벤트고유키 != -1){
	pointDetail.setPointEventNo(pointEventDAO.findByNo(포인트이벤트고유키 , 1));
	}
	
	//포인트디테일 적립 성공시 1반환
	int 성공여부 = pointDetailDAO.save(pointDetail);
	
	if(성공여부 == -1){
		//오류 메세지
		return null;
	}
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("/mypage/memberCheck");
	
	return mv;
	}
	
	
	
	
	//사용 테스트
	@GetMapping("/pointpay")
    public ModelAndView test2(HttpSession session) {
		
	//예약정보를 담음
	Reservation rv = reservationDAO.findByRsvNo(1);
	
	//맴버 정보를 담음
	Member member =  memberMapper.findByNo((Integer)session.getAttribute("no"));

	int 사용할포인트량 = 300;
	
	//포인트이벤트 의 정보를 담음
	PointEvent pointEvent = new PointEvent();
	pointEvent.setReservation_no(rv);//예약
	pointEvent.setMember_no(member);//맴버
	pointEvent.setAmount(-(사용할포인트량));//포인트양
	
	//잔여포인트가 지불할 금액보다 많아야 작동
	if(pointEventDAO.totalPoint(member.getNo(), 0) > 사용할포인트량) {
		
		//성공시 고유키반환 실패시 -1반환
		int 성공여부1 = pointEventDAO.pay(pointEvent);
		
		//포인트디테일 사용 성공시 1반환
		int 성공여부 = pointDetailDAO.pay((Integer)session.getAttribute("no"), 사용할포인트량);
		
		if(성공여부 == -1 || 성공여부1 == -1){
			//오류 메세지
			return null;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/pointpay");
		
		return mv;
		
	}
	
	//실패시 그냥 마이페이지로 가게 해놨어요 (수정필요)
	ModelAndView mv = new ModelAndView();
	mv.setViewName("/mypage");
	
	return mv;
	}
}
