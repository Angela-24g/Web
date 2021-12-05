package com.delluna.hotels.ui_adm;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.dataservice_reservation.IReservationAdmDAO;
import com.delluna.hotels.dataservice_reservation.IReservationDAO;
import com.delluna.hotels.dataservice_reservation.IRezAdmRoomTypeDAO;
import com.delluna.hotels.manage_paging.IPagingService;
import com.delluna.hotels.util.Paging;

@Controller
public class ReservationAdmController {
	@Autowired
	IReservationAdmDAO reservationAdmDAO;
	@Autowired
	IReservationDAO reservationDAO;
	@Autowired
	IRezAdmRoomTypeDAO rezAdmRoomTypeDAO;
	@Autowired
	@Qualifier("pagingService")
	IPagingService pagingService;

	@GetMapping("/adm/adm-rsv-write")
	public ModelAndView gotoAdmRsvWrite() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/adm-rsv-write");
		return mv;
	}

	@RequestMapping(value = "/adm/adm-rsv-write", method = RequestMethod.POST)
	public ModelAndView gotoAdmRsvUpdate(@ModelAttribute ReservationAdm newRsvAdm, HttpSession session) {
		int newRsvAdmNo = reservationAdmDAO.save(newRsvAdm);
		// attachFile이 있을 때
		if (newRsvAdm.getRsv_atc_file() != null) {
			String boardPath = session.getServletContext().getRealPath("/upload/reservationAdm");
			System.out.println(session.getServletContext().getRealPath("/upload/reservationAdm"));
			String newRsvAdmNoLocation = boardPath + "//" + newRsvAdmNo;
			File folder = new File(newRsvAdmNoLocation);
			folder.mkdir();
			for (MultipartFile multipartFile : newRsvAdm.getRsv_atc_file()) {
				File attachFile = new File(newRsvAdmNoLocation + "//" + multipartFile.getOriginalFilename());
				// 예: File attachFile = new
				// File("D://........//upload/reservationAdm/1/my.jpg");
				try {
					multipartFile.transferTo(attachFile);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("title", newRsvAdm.getTitle());
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("redirect:/adm/adm-rsv-list");
		return mv;
	}

	@RequestMapping("/adm/adm-rsv-list")
	public ModelAndView gotoAdmRsvList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = false) String kwd,
			@RequestParam(value = "col", required = false) String col) {
		Paging paging = new Paging();

		paging = pagingService.makeBlock(page);
		List<ReservationAdm> rsvList = null;

		if (kwd == null) {
			pagingService.makeLastPageNum(paging, "예약상품");
			rsvList = reservationAdmDAO.selectList(page, 5, "date_start", "");
		} else {
			pagingService.makeLastPageNum(paging, "예약상품", kwd, col);
			rsvList = reservationAdmDAO.selectList(page, 5, col, kwd);
		}

		Integer blockStartNum = paging.getBlockStartNum();
		Integer blockLastNum = paging.getBlockLastNum();
		Integer lastPageNum = paging.getLastPageNum();

		ModelAndView mv = new ModelAndView();
		mv.addObject("blockStartNum", blockStartNum);
		mv.addObject("blockLastNum", blockLastNum);
		mv.addObject("lastPageNum", lastPageNum);
		mv.addObject("rsvList", rsvList);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/adm-rsv-list");
		return mv;
	}

	@GetMapping("/adm/adm-rsv-view/{no}")
	public ModelAndView gotoAdmRsvView(@PathVariable int no) {
		ReservationAdm rsvView = reservationAdmDAO.findByNoAddView(no, true);
		ReservationAdm viewPrev = reservationAdmDAO.findByPrev(no);
		ReservationAdm viewNext = reservationAdmDAO.findByNext(no);
		// RezAdmRoomType rsvViewType = rezAdmRoomTypeDAO.findByTypeNo(no);

		// 이전다음 no값이 필요함.
		ModelAndView mv = new ModelAndView();
		mv.addObject("rsvView", rsvView);
		mv.addObject("viewPrev", viewPrev);
		mv.addObject("viewNext", viewNext);
		// mv.addObject("rsvViewType", rsvViewType);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/adm-rsv-view");
		return mv;
	}

	@GetMapping(value = "/adm/adm-rsv-write-type/{no}")
	public ModelAndView gotoAdmRsvTypeWrite(@PathVariable int no) {
		ReservationAdm rsvWriteType = reservationAdmDAO.findByNoAddView(no, true);
		List<RoomType> roomType = rezAdmRoomTypeDAO.selectTypeAll();

		// 경로 지정
		ModelAndView mv = new ModelAndView();
		mv.addObject("rsvWriteType", rsvWriteType);
		mv.addObject("roomType", roomType);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/adm-rsv-write-type");
		return mv;
	}

	@RequestMapping(value = "/adm/adm-rsv-write-type", method = RequestMethod.POST)
	public ModelAndView gotoAdmRsvTypeUpdate(@ModelAttribute RezAdmRoomType RaRType, HttpSession session) {
		rezAdmRoomTypeDAO.save(RaRType);
		// 경로 지정
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/adm-rsv-list");
		return mv;
	}

	@RequestMapping("/adm/user-rsv-list")
	public ModelAndView gotoRsvList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = false) String kwd,
			@RequestParam(value = "col", required = false) String col) {
		Paging paging = new Paging();

		paging = pagingService.makeBlock(page);
		List<Reservation> rsvList = null;

		if (kwd == null) {
			pagingService.makeLastPageNum(paging, "예약회원");
			rsvList = reservationDAO.selectList(page, 5, "name", "");
		} else {
			pagingService.makeLastPageNum(paging, "예약회원", kwd, col);
			rsvList = reservationDAO.selectList(page, 5, col, kwd);
		}

		Integer blockStartNum = paging.getBlockStartNum();
		Integer blockLastNum = paging.getBlockLastNum();
		Integer lastPageNum = paging.getLastPageNum();

		ModelAndView mv = new ModelAndView();
		mv.addObject("blockStartNum", blockStartNum);
		mv.addObject("blockLastNum", blockLastNum);
		mv.addObject("lastPageNum", lastPageNum);
		mv.addObject("rsvList", rsvList);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/user-rsv-list");
		return mv;
	}

	@GetMapping("/adm/user-rsv-view/{no}")
	public ModelAndView gotoRsvView(@PathVariable int no) {
		Reservation rrrView = reservationDAO.findByRRRNo(no);

		Reservation viewPrev = reservationDAO.findByPrev(no);
		Reservation viewNext = reservationDAO.findByNext(no);

		// 이전다음 no값이 필요함.
		ModelAndView mv = new ModelAndView();
		mv.addObject("rrrView", rrrView);
		mv.addObject("viewPrev", viewPrev);
		mv.addObject("viewNext", viewNext);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/user-rsv-view");
		return mv;
	}

	@GetMapping(value = "/adm/user-rsv-update/{no}")
	public ModelAndView gotoRsvUpdate(@PathVariable int no) {
		Reservation rsvUpdate = reservationDAO.findByNo(no);

		ModelAndView mv = new ModelAndView();
		mv.addObject("rsvUpdate", rsvUpdate);
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("/adm/user-rsv-update");
		return mv;
	}

	@RequestMapping(value = "/adm/user-rsv-update", method = RequestMethod.POST)
	public ModelAndView saveRsvUpdate(@ModelAttribute Reservation rsvUpdate) {
		reservationDAO.editRsv(rsvUpdate);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adm/user-rsv-list");
		return mv;
	}

//	@GetMapping("/adm/user-rsv-state-update/{no}/{stateVal}")
//	public ModelAndView updateRsvState(@PathVariable int no, @PathVariable String stateVal) {
//		String state = null;
//		if (stateVal == "complete") {
//			state = "예약완료";
//		} else if (stateVal == "cancel") {
//			state = "예약취소";
//		} else {// waiting
//			state = "예약대기";
//		}
//		reservationDAO.updateState(state, no);
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/adm/user-rsv-view/{no}");
//		return mv;
//	}
	@GetMapping("/adm/user-rsv-state-update/{no}/{state}")
	public ModelAndView updateRsvState(@PathVariable int no, @PathVariable String state) {
		reservationDAO.updateState(state, no);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adm/user-rsv-view/{no}");
		return mv;
	}
}
