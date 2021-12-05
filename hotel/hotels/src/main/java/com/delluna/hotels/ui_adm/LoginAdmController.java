package com.delluna.hotels.ui_adm;

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
import com.delluna.hotels.manage_login.ILoginAdmService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class LoginAdmController {
	@Autowired @Qualifier("loginAdmService")ILoginAdmService loginAdmService;
	
	// 관리자 로그인 준비
	@RequestMapping(value="/adm/member/login",method=RequestMethod.GET)
	ModelAndView goAdmLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();	
		BusinessResult br = loginAdmService.goAdmLogin(session);
		if(br.getCode()!=RESULTCODE.정상) {
			if(br.getCode()==RESULTCODE.로그인중) {
			}
		}
		
		mv.setViewName("adm/adm-member-login");
		mv.addObject("js","adm/adm-login.js");
		mv.addObject("css","login/login.css");
		return mv;
	}
	
	//관리자 로그인
	@RequestMapping(value="/adm/member/login",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String admLogin(@RequestBody Member member,HttpSession session) {
		BusinessResult br = loginAdmService.admLogin(member, session);
		if(br.getCode()!=RESULTCODE.정상) {
			return br.getMessage();
		}
		String str = (String)br.getValue();
		return str;
	}
	
	//아이디/비번 찾기 페이지
	@RequestMapping("/adm/member/find")
	public ModelAndView goAdmMemberfind() {
		ModelAndView mv = new ModelAndView();
		BusinessResult br = loginAdmService.goAdmMemberfind();
		
		mv.addObject("css", "login/memberfind.css");
		mv.addObject("js","adm/adm-login.js");
		mv.setViewName("adm/adm-member-find");
		return mv;
	}
	//아이디찾기 ajax
	@RequestMapping("/adm/member/findId")
	@ResponseBody
	public String findId(@RequestBody Member member) {
		BusinessResult br = loginAdmService.findId(member);
		
	    return (String)br.getValue();
	}
	
	//로그아웃
	@RequestMapping("/adm/member/logout")
	public ModelAndView admLogout(HttpSession session) {
		BusinessResult br =loginAdmService.admLogout(session);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adm/index");
		return mv;
	}
}
