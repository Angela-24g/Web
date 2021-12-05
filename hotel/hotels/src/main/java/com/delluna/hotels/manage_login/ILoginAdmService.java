package com.delluna.hotels.manage_login;

import javax.servlet.http.HttpSession;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.util.BusinessResult;

public interface ILoginAdmService {
	BusinessResult goAdmLogin(HttpSession session);
	BusinessResult admLogin(Member member, HttpSession session);
	BusinessResult goAdmMemberfind();
	BusinessResult admLogout(HttpSession session);
	BusinessResult findId(Member member);
	
}
