package com.delluna.hotels.manage_member;

import java.net.ConnectException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.EmailCodeUtil;
import com.delluna.hotels.util.EmailMessgeUtil;
import com.delluna.hotels.util.EmailToType;
import com.delluna.hotels.util.RESULTCODE;

@Service("joinService")
public class JoinService implements IJoinService {
	@Autowired(required=false) IMemberDAO memberDAO;
	
	@Autowired(required=false) private JavaMailSenderImpl javaMailSenderImpl;
	
	//회원가입 - 약관동의페이지 가기
	@Override
	@Transactional
	public BusinessResult goJoin1() {
		return new BusinessResult();
	}

	//회원가입 - 본인인증페이지 가기
	@Override
	@Transactional
	public BusinessResult goJoin2(String marketing) {
		return new BusinessResult();
	}
	
	//회원이메일
	@Override
	public BusinessResult sendCodeMail(EmailToType toType, HttpSession session) {
		
		try {
			MimeMessage mailMessage = javaMailSenderImpl.createMimeMessage();
			MimeMessageHelper message;
			message = new MimeMessageHelper(mailMessage,true,"utf-8");
			message.setTo(toType.getEmail());
			String html = null;
			
			//회원가입 - 인증코드 보내기 (AJAX)
			if(toType.getType().equals("verify")) {
				//중복아닐 시 메일 보내기
				int authNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
				System.out.println(String.valueOf(authNo));
				//이메일중복확인
				boolean isinEmail = false;
				try {
					isinEmail = memberDAO.isinEmail(toType.getEmail());
				} catch (Exception e) {
					if(e instanceof ConnectException) {
						return new BusinessResult(RESULTCODE.NETWORK_ERROR,"네트워크 통신이 원활하지 않습니다.");
					}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
				
				if(isinEmail) {
					return new BusinessResult("No");
				}

				message.setFrom("dojh555@gmail.com");
				message.setSubject("HOTEL DELLUNA 회원가입 인증 메일입니다.");
				session.setAttribute("authNum", authNo);
				session.setMaxInactiveInterval(60*20);
				
				html = EmailMessgeUtil.getVerifyEmailMessge(authNo);
				
			}else if(toType.getType().equals("findPw")) {
				int authNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
				//비교를 해야해 (type으로 들어온 데이터를 비교할 것)
				String id = toType.getId();
				//비교를 할 id를 불러와야 해(memberDAO의 데이터를 가져올 것)
				String name = toType.getName();
				System.out.println(toType.getName());
				String email = toType.getEmail();
				
				if(!memberDAO.gomail(id, name, email,"가입","가입",1))
				{
				return  new BusinessResult("No");
				
				}
				message.setFrom("yeong973@gmail.com");
				message.setSubject("HOTEL DELLUNA 비밀번호 찾기 메일입니다.");
				html = EmailMessgeUtil.getFindPwEmailMessage(authNo);
				Member member = new Member();
				String i = Integer.toString(authNo);
				session.setAttribute("id", id);
				session.setAttribute("pw", i);
				
			}else if(toType.getType().equals("findAdmPw")) {//관리자 페이지 패스워드 찾기
				
				int authNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
				
				String pw = Integer.toString(authNo);
				String id = toType.getId();
				String name = toType.getName();
				String email = toType.getEmail();
				
				if(!memberDAO.gomail(id, name, email,"대기","가입",8)) {
					return new BusinessResult("No");
				}
				message.setFrom("dojh555@gmail.com");
				message.setSubject("HOTEL DELLUNA 비밀번호 찾기 메일입니다.");
				//메일 메시지
				html = EmailMessgeUtil.getFindPwEmailMessage(authNo);
				//패스워드 바꾸기
				memberDAO.uppw(id, pw);
			}			
			
			message.setText(html, true); 
			// 메일발송
			javaMailSenderImpl.send(mailMessage);
			System.out.println("success to send email");
		}catch (MessagingException e) {
			e.printStackTrace();
		}
			
		return new BusinessResult("Yes");
	}
	
	//회원가입 - 인증코드 확인(AJAX)
	@Override
	@Transactional
	public BusinessResult confirmMailCode(EmailCodeUtil forCode, HttpServletRequest request,HttpSession session) {
		int no = 0;
		if(session.getAttribute("authNum") != null) {
			no = (Integer)session.getAttribute("authNum");
		}else {
			return new BusinessResult("E");
		}
			
		//ajax 통신으로 가져올 입력값을 EmailCodeUtil 의 멤버변수에 매칭
		if(no != Integer.valueOf(forCode.getCode())) {// 일치하지 않을 시 'N' 반환
			return new BusinessResult("N");
		}else {
			session.removeAttribute("authNum");
			return new BusinessResult("Y");
		}
		
	}

	//회원가입 - 정보입력페이지 가기
	@Override
	@Transactional
	public BusinessResult goJoin3(String marketing, String email) {
		return new BusinessResult();
	}
	
	
	//회원가입 - 아이디중복 확인
	@Override
	@Transactional
	public BusinessResult confirmId(Member member_id) {
		boolean isId = false;
		try {
			isId = memberDAO.isinId(member_id.getId());
		} catch (Exception e) {
			if(e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR,"네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		if(isId) {
			return new BusinessResult("N");
		}
		return new BusinessResult("Y");
	}

	//회원가입 - 정보입력후 DB에 저장
	@Override
//	@Transactional
	public BusinessResult addMember(Member member,HttpSession session) {
		try {
			memberDAO.save(member);
			System.out.println(member.getName());
			// 저장 후 바로 로그인
			session.setAttribute("name", member.getName());
			session.setAttribute("no", member.getNo());
//			if(grade>=8) {//관리자 등급으로 로그인했는지 확인후 session 에 올리기
//				session.setAttribute("grade", 번호와성명.get("grade"));
//			}
		} catch (Exception e) {
			if(e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR,"네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return new BusinessResult(member);
	}

	//회원가입 - DB저장 후 회원환영페이지 가기
	@Override
	public BusinessResult goJoin4() {
		return new BusinessResult();
	}
	
	//회원가입(관리자) - 정보입력페이지 가기
	@Override
	@Transactional
	public BusinessResult goAdmJoin() {
		return new BusinessResult();
	}

	//회원가입(관리자) - 정보입력후 DB에 저장
	@Override
	public BusinessResult addAdmMember(Member member, HttpSession session) {
		try {
			memberDAO.saveAdm(member, "대기", 8);//대기 = 로그인여부, 8 = 기본 관리자 등급
			System.out.println(member.getName());
			// 저장 후 바로 로그인
			session.setAttribute("name", member.getName());
			session.setAttribute("no", member.getNo());
		} catch (Exception e) {
			if(e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR,"네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return new BusinessResult(member);
	}


}
