package com.delluna.hotels.env;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntecepter extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		
		boolean 관리자여부 = false;
		
		if(session == null || session.getAttribute("no") == null) {//로그아웃 상태는 LoginIntercepter 가 해결
			return true;//컨트롤 넘어가기
		}
		
		//로그인 + 관리자 등급일 때
		if (session.getAttribute("no") != null && (Integer)session.getAttribute("grade") >= 8) {
			관리자여부 = true;
			return true;//컨트롤 넘어가기
		}

		
		//로그인 되었지만 관리자등급 미달이라 grade 가 올라가있지 않을시
		if(!관리자여부)		
		{
			response.sendRedirect("/index");
			return false;//컨트롤 넘어가지 않기
		}
		return true;//컨트롤 넘어가기
	}

}
