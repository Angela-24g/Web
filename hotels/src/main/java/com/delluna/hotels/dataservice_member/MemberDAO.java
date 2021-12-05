package com.delluna.hotels.dataservice_member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_member.Member;

@Repository
public class MemberDAO implements IMemberDAO {
	
	@Autowired IMemberMapper memberMapper;

	//adm 회원 전체보기
	@Override
	@Transactional
	public List<Member> selectAll() {
		return memberMapper.selectAll();
	}
	
	//회원가입
	@Override
	@Transactional
	public void save(Member member) {
		memberMapper.save(member);
	}
	
	//회원가입(관리자)
	@Override
	public void saveAdm(Member member,String state,int grade) {
		member.setGrade(grade);
		member.setState(state);
		memberMapper.saveAdm(member);
	}

	//아이디중복확인
	@Override
	@Transactional
	public boolean isinId(String id) {
		return memberMapper.isinId(id);
	}
	//이메일중복확인
	@Override
	public boolean isinEmail(String email) {
		return memberMapper.isinEmail(email);
	}	
	//mypage 회원 이름출력
	@Override
	@Transactional
	public Member findMember(int no) {
		return memberMapper.findMember(no);
	}
		
	//mypage 회원 정보보기
	@Override
	@Transactional
	public Member findByNo(int no) {
		return memberMapper.findByNo(no);
	}

	
	//아이디찾기
	@Override
	@Transactional
	public Member findid(String name, String tel,String state1,String state2,int grade) {
		return memberMapper.findid(name,tel,state1,state2,grade);
	}
	//로그인하기
	@Override
	public boolean isIn(String id, String pw,String state,int grade) {
		return memberMapper.isIn(id,pw,state,grade);
	}
	//관리자 로그인하기
	@Override
	public boolean isInAdm(String id, String pw,String state1,String state2,int grade) {
		return memberMapper.isInAdm(id,pw,state1,state2,grade);
	}
	//비밀번호찾기
	@Override
	public boolean gomail(String id, String name, String email,String state1,String state2,int grade) {
		return memberMapper.gomail(id, name, email,state1,state2,grade);
	}
	//로그인시 no,name 만 가져와 session 에 올리기
	@Override
	public HashMap<String,Object> islogin(String id, String pw) {
		// TODO Auto-generated method stub
		return memberMapper.islogin(id, pw);
	}
	//비번 바꾸기
	@Override
	public void uppw(String id, String pw) {
		memberMapper.uppw(id, pw);
	}
	//관리자 로그인 가입,대기 상태확인 
	@Override
	public boolean isApproval(String id, String pw, String state) {
		return memberMapper.isApproval(id, pw, state);
	}
	//가입,대기,탈퇴 상태 업데이트 - 탈퇴시 이용
	@Override
	public void approval(String state, int no) {
		memberMapper.approval(state, no);
	}
	//클라이언트 마이페이지 회원정보수정
	@Override
	public void updateMypage(Member member) {
		memberMapper.updateMypage(member);
	}

	@Override
	public int updatelgno(int sno, String id) {
		return memberMapper.updatelgno(sno, id);
	}

	@Override
	public Member findById(String id) {
		return memberMapper.findById(id);
	}

}
