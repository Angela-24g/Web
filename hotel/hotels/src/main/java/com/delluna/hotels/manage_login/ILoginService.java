package com.delluna.hotels.manage_login;

import javax.servlet.http.HttpSession;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.util.BusinessResult;


public interface ILoginService {
	//로그인하기(회원찾기) - (AJAX)
	BusinessResult login(Member member, HttpSession session);
	//아이디 찾기 - (AJAX)
	BusinessResult findid(Member member);
	//로그인 업데이트 제한
	BusinessResult updatelgno(int sno, String id);
	//아이디로 상태 찾기
	BusinessResult findById(String id);
}
