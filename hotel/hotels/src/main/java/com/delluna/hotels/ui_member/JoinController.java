package com.delluna.hotels.ui_member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.manage_member.IJoinService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.EmailCodeUtil;
import com.delluna.hotels.util.EmailToType;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class JoinController {
	@Autowired @Qualifier("joinService") IJoinService joinService;
	
	//회원가입 - 약관동의페이지 가기
	@RequestMapping(value={"/member/joinStep1","/member"})
	public ModelAndView goJoin1() {
		BusinessResult br = joinService.goJoin1();
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("js","member/join.js");
		mv.addObject("css","member/terms.css");
		mv.setViewName("member/terms");
		return mv;
	}
	
	//회원가입 - 본인인증페이지 가기
	@RequestMapping(value="/member/joinStep2")
	public ModelAndView goJoin2(String marketing) {
		BusinessResult br = joinService.goJoin2(marketing);
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		
		
		ModelAndView mv = new ModelAndView();

		if(marketing==null) {
			mv.setViewName("redirect:/member/joinStep1");
			return mv;
		}
		mv.addObject("marketing",marketing);
		mv.addObject("js","member/join.js");
		mv.addObject("css","member/common_join.css");
		mv.setViewName("member/verify");
		return mv;
	}
	//회원가입 - 인증코드 보내기(AJAX)
	@ResponseBody
	@RequestMapping(value="/member/mailcode")
	public String sendCodeMail(@RequestBody EmailToType toType, HttpSession session) {
		BusinessResult br = joinService.sendCodeMail(toType, session);
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		return (String)br.getValue();
	}
	
	//회원가입 - 인증코드 확인(AJAX)
	@ResponseBody 
	@RequestMapping(value="/member/authcode", method = RequestMethod.POST)
	public String confirmMailCode(@RequestBody EmailCodeUtil forCode, HttpServletRequest request,HttpSession session) {
		BusinessResult br = joinService.confirmMailCode(forCode,request,session);
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		
		return (String)br.getValue();
	}
	
	//회원가입 - 정보입력페이지 가기
	@RequestMapping(value="/member/joinStep3")
	public ModelAndView goJoin3(String marketing,String email) {
		BusinessResult br = joinService.goJoin3(marketing,email);
		if(br.getCode() !=RESULTCODE.정상) {}//비정상처리
		
		
		ModelAndView mv = new ModelAndView();
		
		if(marketing==null) {
			mv.setViewName("redirect:/member/joinStep1");
			return mv;
		}
		mv.addObject("marketing", marketing);
		mv.addObject("email", email);
		mv.addObject("js","member/join.js");
		mv.addObject("css","member/common_join.css");
		mv.setViewName("member/infoInput");
		return mv;
	}
	
	//회원가입 - 아이디중복 확인
	@RequestMapping("/member/id")
	@ResponseBody
	public String confirmId(@RequestBody Member member_id) {
		ModelAndView mv = new ModelAndView();
		
		BusinessResult br =joinService.confirmId(member_id);
		if(br.getCode()!=RESULTCODE.정상) {
			if(br.getCode()==RESULTCODE.NETWORK_ERROR) {
				mv.addObject("message", br.getMessage());
				mv.setViewName("forward:/index");
			}
		}//비정상처리
		
		return (String)br.getValue();
	}
	
	//회원가입 - 정보입력후 DB에 저장
	@RequestMapping(value="/member/addMember")
	public ModelAndView addMember(Member member,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if(member==null) {
			mv.setViewName("redirect:/member/joinStep1");
			return mv;
		}
		
		BusinessResult br = joinService.addMember(member, session);
		
		if(br.getCode()!=RESULTCODE.정상) {
			if(br.getCode()==RESULTCODE.NETWORK_ERROR) {
				mv.addObject("message", br.getMessage());
				mv.setViewName("forward:/index");
			}
		}//비정상처리
		
		
		mv.setViewName("redirect:/member/joinStep4");
		return mv;
	}
	
	
	//회원가입 - DB저장 후 회원환영페이지 가기
	@RequestMapping(value="/member/joinStep4")
	public ModelAndView goJoin4() {
		BusinessResult br = joinService.goJoin4();
		if(br.getCode()!=RESULTCODE.정상) {}
		ModelAndView mv = new ModelAndView();
		
		
		mv.addObject("js","member/join.js");
		mv.addObject("css","member/common_join.css");
		mv.setViewName("member/complete");
		return mv;
	}

}

