package com.delluna.hotels.manage_login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.delluna.hotels.common_member.*;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.util.BusinessResult;

@Service("LoginService")
public class LoginService implements ILoginService {
	
	@Autowired IMemberDAO memberDAO;
	
	@Override
	@Transactional
	public BusinessResult login(Member member, HttpSession session) {
		boolean isin= false;
		isin = memberDAO.isIn(member.getId(), member.getPw(),"가입",1);
		HashMap<String,Object> 번호와성명=memberDAO.islogin(member.getId(), member.getPw());
			
		if(isin) {
			session.setAttribute("no", 번호와성명.get("no")); //회원번호가 로그인 시에 세션에 올라간다.
			session.setAttribute("name", 번호와성명.get("name"));
			session.setAttribute("grade", 번호와성명.get("grade"));
			System.out.println(session.getAttribute("no"));
			return new BusinessResult("Y");
		}
		else if(isin && member.getId()==null)
		{
			System.out.println(member.getId());
			System.out.println("보자");
			return new BusinessResult("F");
		}
		else {
		return new BusinessResult("N");}
	}

	@Override
	public BusinessResult findid(Member member) {
		 Member memberid = memberDAO.findid(member.getName(), member.getTel(),"가입","가입",1);
	
			if(memberid==null) {
				return new BusinessResult("N");
			}
			return new BusinessResult(memberid.getId());
	}

	@Override
	public BusinessResult updatelgno(int sno, String id) {
		int member = memberDAO.updatelgno(sno, id);
	
		if(member>=5)
		{
		   return new BusinessResult();
		}	
		
		return new BusinessResult(sno);
	}

	@Override
	public BusinessResult findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}
