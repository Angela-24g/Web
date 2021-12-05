package com.delluna.hotels.dataservice_notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;

public interface IQnaDAO {
	//질문 저장(
	int save(Qna qna);
	
	//질문찾기
	List<Qna> SelectALL(int start,int cnt);
	//이것은 그냥 게시물 찾기
	List<Qna> selectAll(int writer);
	
	//질문 순서대로 뽑기(리스트)
	
	List<Qnares> Select(int start,int cnt);
	 public List<Qna> selectByMemberNo(int member_no);
	//질문 찾기
	Qna findByNo(int qno);
	//답변 찾기
	Qnares findByQno(int qno);
	//번호로 제목가져오기
	
	void delete(int no);
	void deleteR(int qno);
	
	int getCount();
	int qrCount();
	
	//답변 등록하기
	void saverqna(Qnares qnares);
	//답변 상태 바꾸기
	void udState(String qstate, String qsts, int no);
	//답변 수정
	void udateResp(String response,int qno);
	//일단은!
	List<Qna> select();
	//답변 삭제
	void deleteResp(int no);
	//답변 번호 확인하기
	Qnares getRqno();
}
