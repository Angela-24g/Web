package com.delluna.hotels.manage_login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Service("loginAdmService")
public class LoginAdmService implements ILoginAdmService{
	@Autowired IMemberDAO memberDAO;

	@Override
	public BusinessResult goAdmLogin(HttpSession session) {
		if(session != null && session.getAttribute("no")!=null) {
			return new BusinessResult(RESULTCODE.로그인중);
		}
		return new BusinessResult();
	}

	@Override
	public BusinessResult admLogin(Member member, HttpSession session) {
		String id = member.getId();
		String pw = member.getPw();
		
		boolean isInAdm = false;
		isInAdm = memberDAO.isInAdm(id, pw,"가입","대기", 8);
		boolean isApproval = false;
		isApproval = memberDAO.isApproval(id, pw, "가입");
		
		if(isInAdm) {
			if(isApproval) {
				//관리자 회원이면서 승인 받음
				HashMap<String,Object> 번호와성명=memberDAO.islogin(member.getId(), member.getPw());
				session.setAttribute("no", 번호와성명.get("no"));
				session.setAttribute("name", 번호와성명.get("name"));
				session.setAttribute("grade", 번호와성명.get("grade"));
				
				return new BusinessResult("Y");
				
			}else {//관리자 회원가입은 했지만 미승인
				return new BusinessResult(RESULTCODE.미승인,"관리자 승인 대기중입니다.");
			}
		}else {
			return new BusinessResult(RESULTCODE.아이디_패스워드불일치,"회원 정보가 일치하지 않습니다.");
		}
		
	}

	@Override
	public BusinessResult goAdmMemberfind() {
		return new BusinessResult();
	}

	@Override
	public BusinessResult admLogout(HttpSession session) {
		if(session!=null) {
			session.removeAttribute("name");
			session.removeAttribute("no");
			session.removeAttribute("grade");
		}
		return new BusinessResult();
	}

	@Override
	public BusinessResult findId(Member member) {
		Member memberForId = memberDAO.findid(member.getName(), member.getTel(),"대기","가입",8);
		
		if(memberForId==null) {
			return new BusinessResult("N");
		}
		return new BusinessResult(memberForId.getId());
	}

}
