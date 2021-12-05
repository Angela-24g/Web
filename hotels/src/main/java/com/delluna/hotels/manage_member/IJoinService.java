package com.delluna.hotels.manage_member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.EmailCodeUtil;
import com.delluna.hotels.util.EmailToType;

public interface IJoinService {
	//회원가입 - 약관동의페이지 가기
	BusinessResult goJoin1();
	
	//회원가입 - 본인인증페이지 가기
	BusinessResult goJoin2(String marketing);
	
	//회원가입 - 인증코드 보내기(AJAX)
	BusinessResult sendCodeMail(EmailToType toType,HttpSession session);
	
	//회원가입 - 인증코드 확인(AJAX)
	BusinessResult confirmMailCode(EmailCodeUtil forCode, HttpServletRequest request,HttpSession session);
	
	//회원가입 - 정보입력페이지 가기
	BusinessResult goJoin3(String marketing,String email);
	
	//회원가입(관리자) - 정보입력페이지 가기
	BusinessResult goAdmJoin();
	
	//회원가입 - 아이디중복 확인
	BusinessResult confirmId(Member member_id);
	
	//회원가입 - 정보입력후 DB에 저장
	BusinessResult addMember(Member member,HttpSession session);
	
	//회원가입(관리자) - 정보입력후 DB에 저장
	BusinessResult addAdmMember(Member member,HttpSession session);
	
	//회원가입 - DB저장 후 회원환영페이지 가기
	BusinessResult goJoin4();
	
}
