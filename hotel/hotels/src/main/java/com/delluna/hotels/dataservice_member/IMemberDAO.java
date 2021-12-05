package com.delluna.hotels.dataservice_member;

import java.util.HashMap;
import java.util.List;

import com.delluna.hotels.common_member.Member;

public interface IMemberDAO {
	//adm 회원 전체보기
	List<Member> selectAll();
	//회원가입
	void save(Member member);
	//회원가입(관리자)
	void saveAdm(Member member,String state,int grade);
	//아이디중복확인
	boolean isinId(String id);
	//이메일중복확인
	boolean isinEmail(String email);
	//id와 비번으로 로그인하기
	boolean isIn(String id, String pw,String state,int grade);
	//관리자 id와 비번으로 로그인
	boolean isInAdm(String id, String pw,String state1,String state2,int grade);
	//mypage 회원 이름출력
	Member findMember(int no);
	//mypage 회원 정보보기
	Member findByNo(int no);
	//이름과 번호로 아이디 찾기
	Member findid(String name,String tel,String state1,String state2,int grade);
	//아이디와 이름으로 이메일 찾기
	boolean gomail(String id, String name, String email,String state1,String state2,int grade);
	//로그인 얻기
	HashMap<String,Object> islogin(String id, String pw);
	//비밀번호 업데이트하기
	void uppw(String id, String pw);
	//관리자 승인,대기 상태확인                                                               
	boolean isApproval(String id, String pw,String state);
	//가입,대기,탈퇴 상태 업데이트 - 탈퇴시 이용
	void approval(String state,int no);
	//클라이언트 마이페이지 회원정보수정
	void updateMypage(Member member);
	//로그인 횟수 세기
	Member findById(String id);
	//로그인 횟수 업데이트
	int updatelgno(int sno, String no);
}
