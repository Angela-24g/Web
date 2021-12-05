package com.delluna.hotels.ui_login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.dataservice_restaurants.IRestaurantsDAO;
import com.delluna.hotels.manage_login.ILoginService;
import com.delluna.hotels.util.BusinessResult;

class ResultData{
	String result;
	int tryno;
	
	public int getTryno() {
		return tryno;
	}

	public int setTryno(int tryno) {
		return this.tryno = tryno;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}


@Controller
public class LoginController {
	@Autowired @Qualifier("LoginService") ILoginService loginService;
	@Autowired IMemberDAO memberDAO;
	@Autowired IRestaurantsDAO restaurantsDAO;
		//비회원로그인
		@GetMapping("/loginstranger")
		public ModelAndView 비회원로그인() {
			ModelAndView mv=new ModelAndView();
			mv.addObject("css", "login/login-nonmember.css");
		//	mv.addObject("js", "login/login.js");
			mv.setViewName("login/login-nonmember");
			return mv;
		}
	 
		@PostMapping("/loginstranger")
		public ModelAndView 비회원로그인1(HttpSession session, String USER_NM, String USER_TEL1, String USER_TEL2, String USER_TEL3) {
			RestaurantsNon rstn = new RestaurantsNon();
			String tell = USER_TEL1 + '-' + USER_TEL2 + '-' + USER_TEL3;
			boolean isnon = restaurantsDAO.isnon(USER_NM, tell);
			ModelAndView mv=new ModelAndView();
			System.out.println(tell);
			System.out.println(USER_NM);
			System.out.println(isnon);
			if(isnon==false) {
			mv.addObject("retry", "g");
			mv.addObject("css", "login/login-nonmember.css");
			mv.setViewName("redirect:/loginstranger");
			return mv;
			}
			session.setAttribute("uname", USER_NM);
			session.setAttribute("utel", tell);
			mv.addObject("css", "mypage/reservationDin.css");
			mv.setViewName("forward:/mypage/reservationDinNon");
			return mv;
		}
		
		//로그인 준비
		@GetMapping("/login")
		public ModelAndView 로그인준비하다() {
			ModelAndView mv=new ModelAndView();
			mv.addObject("css", "login/login.css");
			mv.setViewName("login/login");
			return mv;
		}
		
		//로그인하기
		@RequestMapping(value="/login")
		@ResponseBody
		public ResultData login(@RequestBody Member member, HttpSession session) {
			BusinessResult br = loginService.login(member, session);
			Member sno = memberDAO.findById(member.getId());
		    //비정상처리
			ResultData resultData= new ResultData();
			resultData.setResult((String)br.getValue());
			System.out.println(member.getNo());
		
			if(sno==null)
			{
				resultData.setResult("F");
				System.out.println("경로!");
				return resultData;
			}	
		
			else {	
				
				
				if(sno.getSno()>=5)
			{
				
				br = loginService.updatelgno(0, member.getId());
				resultData.setTryno((int) br.getValue());
			    return resultData;	
			}
				
			int ssno = sno.getSno();
			br = loginService.updatelgno(ssno+1, member.getId());
			resultData.setTryno((int) br.getValue());
			
		    return resultData; //아예 문자열 형식이어서 클래스를 따로 만들어주고 호출한 것!!	
			}
		}
		//비밀번호 바꾸기
		@RequestMapping("/login-change")
		public ModelAndView changepw(Member member, HttpSession session) {		
			
			String id = (String)session.getAttribute("id");
			String pw = (String)session.getAttribute("pw");
			
			memberDAO.uppw(id, pw);
			
			ModelAndView mv=new ModelAndView();
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		//로그아웃 하기
		@RequestMapping("/logout")
		public ModelAndView process(HttpSession session) {		
			if(session!=null) {
				System.out.println(session.getAttribute("no"));
				session.invalidate();
			}
			ModelAndView mv=new ModelAndView();
			mv.setViewName("redirect:/index");
			return mv;
		}
		
		//아이디/비번 찾기 페이지
		@RequestMapping("/member/find")
		public ModelAndView memberfind() {
			ModelAndView mv = new ModelAndView();
			mv.addObject("css", "login/memberfind.css");
			mv.setViewName("login/memberfind");
			return mv;
		}
		
		//아이디 찾기
		@RequestMapping("/member/find/id")
		@ResponseBody
		public ResultData idfind(@RequestBody Member member) 
		{
			BusinessResult br = loginService.findid(member);
	
			ResultData resultData= new ResultData();
			resultData.setResult((String)br.getValue());	
			System.out.println(br.getValue());
		    return resultData;
		}	
		
}
