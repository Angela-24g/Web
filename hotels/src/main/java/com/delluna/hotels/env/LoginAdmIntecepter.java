package com.delluna.hotels.env;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginAdmIntecepter extends HandlerInterceptorAdapter {

	//preHandle 은 컨트롤러 전에 실행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		
		boolean 로그인 = false;
		if (session != null && session.getAttribute("no") != null) {
			로그인 = true;
		};
		
		if(!로그인)		
		{
			response.sendRedirect("/adm/member/login");
			return false;//컨트롤 넘어가지 않기
		}
		return true;//컨트롤 넘어가기
	}

}
