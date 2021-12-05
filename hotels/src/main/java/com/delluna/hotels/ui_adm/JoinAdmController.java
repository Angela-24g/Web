package com.delluna.hotels.ui_adm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.manage_member.IJoinService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class JoinAdmController {
	@Autowired @Qualifier("joinService") IJoinService joinService;
	
	//회원가입(관리자) - 정보입력페이지 가기
	@RequestMapping(value="/adm/member/join")
	public ModelAndView goAdmJoin() {
		BusinessResult br = joinService.goAdmJoin();
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("js","member/join.js");
		mv.addObject("css","member/common_join.css");
		mv.setViewName("adm/adm-member-join");
		return mv;
	}
	
	//회원가입(관리자) - 정보입력후 DB에 저장
	@RequestMapping(value="/adm/member/addMember")
	public ModelAndView addAdmMember(Member member,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("여기");
		
		BusinessResult br = joinService.addAdmMember(member, session);
		
		if(br.getCode()!=RESULTCODE.정상) {
			if(br.getCode()==RESULTCODE.NETWORK_ERROR) {
				mv.addObject("message", br.getMessage());
				mv.setViewName("forward:/adm");
			}
		}//비정상처리
		
		if(member==null) {
			mv.setViewName("redirect:/adm/member/join");
			return mv;
		}
		
		mv.setViewName("redirect:/adm/index");
		return mv;
	}
}
