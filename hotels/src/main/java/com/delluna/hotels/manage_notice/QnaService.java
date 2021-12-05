package com.delluna.hotels.manage_notice;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.delluna.hotels.common_notice.Qna;

import com.delluna.hotels.dataservice_notice.IQnaDAO;
import com.delluna.hotels.util.BusinessResult;

@Service("qnaService")
public class QnaService implements IQnaService {
	@Autowired IQnaService qnaService;
	@Autowired IQnaDAO qnaDAO;
	
	@Override
	@Transactional
	public BusinessResult saveQna(Qna qna) {

		qnaDAO.save(qna);
		System.out.println("qna저장완료");
		

		if(qna.getContents()==null) {
			System.out.println("여기");
			return new BusinessResult("N");
		}

		return new BusinessResult("Y");


	}	 
		 
		
}
