package com.delluna.hotels.dataservice_notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;

@Repository
public class QnaDAO implements IQnaDAO{
	@Autowired IQnaMapper qnaMapper;
	
	@Override
	@Transactional
		public int save(Qna qna) {
			qnaMapper.save(qna);
			return qna.getNo();
		}

	@Override
	public List<Qna> selectAll(int writer) {
		return qnaMapper.selectAll(writer);
	}	
	
	@Override
	public List<Qna> selectByMemberNo(int member_no) {
		return null;
	}	
	
	@Override
	public Qna findByNo(int no) {
		// TODO Auto-generated method stub
		return qnaMapper.findByNo(no);
	}

	@Override
	public void delete(int no) {
		qnaMapper.delete(no);
		
	}
	
	@Override
	public int getCount() {
		return qnaMapper.getCount();
		
	}

	@Override
	public void saverqna(Qnares qnares) {
		qnaMapper.saverqna(qnares);
	}

	@Override
	@Transactional
	public void udState(String qstate, String qsts, int no) {
		qnaMapper.udState(qstate, qsts, no);		
	}



	@Override
	public void udateResp(String response, int qno) {
		qnaMapper.udateResp(response, qno);
		
	}

	@Override
	public Qnares findByQno(int qno) {
		
		return qnaMapper.findByQno(qno);
	}

	
	@Override
	public List<Qna> select() {
		// TODO Auto-generated method stub
		return qnaMapper.select();
	}

	@Override
	public List<Qna> SelectALL(int start, int cnt) {
		// TODO Auto-generated method stub
		return qnaMapper.SelectALL(start, cnt);
	}

	@Override
	public List<Qnares> Select(int start, int cnt) {
		// TODO Auto-generated method stub
		return qnaMapper.Select(start, cnt);
	}

	@Override
	public int qrCount() {
		// TODO Auto-generated method stub
		return qnaMapper.qrCount();
	}

	@Override
	public void deleteResp(int no) {
		// TODO Auto-generated method stub
		qnaMapper.deleteResp(no);
	}

	@Override
	public Qnares getRqno() {
		// TODO Auto-generated method stub
		return qnaMapper.getRqno();
	}

	@Override
	public void deleteR(int qno) {
		qnaMapper.deleteR(qno);
		
	}

	

}
