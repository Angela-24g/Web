package com.delluna.hotels.ui_notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.dataservice_notice.QnaDAO;
import com.delluna.hotels.manage_notice.IQnaService;

import com.delluna.hotels.util.BusinessResult;

@Controller
public class NoticeController {
	@Autowired @Qualifier("qnaService") IQnaService qnaService;
	@Autowired IMemberDAO memberDAO;
	//qna 단
	@GetMapping("/notice/qna")
	public ModelAndView qna(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member member = null;

		if(session.getAttribute("no")!=null)
		{
			int no = (int) session.getAttribute("no");	
			member = memberDAO.findByNo(no);
			String email = member.getEmail();
			String tel1 = (member.getTel()).substring(0,3);
			String tel2 = (member.getTel()).substring(3,7);
			String tel3 = (member.getTel()).substring(7,11);
			mv.addObject("email",email);
			mv.addObject("tel1",tel1);
			mv.addObject("tel2",tel2);
			mv.addObject("tel3",tel3);
			mv.addObject("css", "notice/qna.css");
			mv.addObject("js", "notice/qna.js");
			mv.setViewName("/notice/qna");
			return mv;
		}
	
		
		session.setAttribute("f", "f");
		mv.setViewName("redirect:/login");
		return mv; 
	}
	
	//질문등록하기
	@RequestMapping(value="/notice/qna", method=RequestMethod.POST)	
	@ResponseBody
	public String addqna(@RequestBody Qna 새질문, HttpSession session) {
		System.out.println("QNAQNA");
		Member writer = new Member();
		writer.setNo((int)session.getAttribute("no"));
		새질문.setWriter(writer);
		새질문.setQsts("답변대기");
	
		BusinessResult br = qnaService.saveQna(새질문);
		
		
	    //비정상처리
		return (String)br.getValue(); 
			}

	
	// faq 단
	
	@RequestMapping("/notice/faq")
	public ModelAndView faq() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/faq.css");
		mv.addObject("js", "notice/faq.js");
		mv.setViewName("notice/faq");
		return mv;
	}
	@RequestMapping("/notice/faq/reservation")
	public ModelAndView faq1() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/faq.css");
		mv.setViewName("notice/faq-reserv");
		return mv;
	}
	@RequestMapping("/notice/faq/lifestyle")
	public ModelAndView faq2() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/faq.css");
		mv.setViewName("notice/faq-lifestyle");
		return mv;
	}
	@RequestMapping("/notice/faq/room")
	public ModelAndView faq3() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/faq.css");
		mv.setViewName("notice/faq-room");
		return mv;
	}
	@RequestMapping("/notice/faq/others")
	public ModelAndView faq4() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/faq.css");
		mv.setViewName("notice/faq-others");
		return mv;
	}
	
	// map 단
	@RequestMapping("/notice/location")
	public ModelAndView location() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "notice/location.css");
		mv.setViewName("notice/location");
		return mv;
	}
	
	
}
