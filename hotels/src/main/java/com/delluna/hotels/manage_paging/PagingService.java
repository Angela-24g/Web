package com.delluna.hotels.manage_paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.delluna.hotels.dataservice_adm.AdmDAO;
import com.delluna.hotels.dataservice_lifestyle.ILifestyleDAO;
import com.delluna.hotels.dataservice_notice.IQnaDAO;
import com.delluna.hotels.dataservice_reservation.IReservationAdmDAO;
import com.delluna.hotels.dataservice_reservation.IReservationDAO;
import com.delluna.hotels.dataservice_restaurants.IRestaurantsDAO;
import com.delluna.hotels.dataservice_rooms.IRoomsDAO;
import com.delluna.hotels.util.Paging;

@Service("pagingService")
public class PagingService implements IPagingService {
	@Autowired
	AdmDAO admDAO;
	@Autowired
	IRoomsDAO roomsDAO;
	@Autowired
	ILifestyleDAO lifestyleDAO;
	@Autowired
	IReservationAdmDAO reservationAdmDAO;
	@Autowired
	IReservationDAO reservationDAO;
	@Autowired
	IRestaurantsDAO restaurantsDAO;
	@Autowired 
	IQnaDAO qnaDAO;
	
	// block을 생성
	// 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
	@Override
	public Paging makeBlock(int curPage) {
		int blockNum = 0;
		Paging paging = new Paging();
		int pageCount = 5;

		blockNum = (int) Math.floor((curPage - 1) / pageCount);
		int blockStartNum = (pageCount * blockNum) + 1;
		int blockLastNum = blockStartNum + (pageCount - 1);

		paging.setPageCount(pageCount);
		paging.setBlockStartNum(blockStartNum);
		paging.setBlockLastNum(blockLastNum);

		return paging;

	}

	// 총 페이지의 마지막 번호
	@Override
	public void makeLastPageNum(Paging paging, String str) {
		int total = 0;
		int lastPageNum = 0;
		int pageCount = paging.getPageCount();

		if (str.equals("회원")) {
			total = admDAO.getCount();
		}
		if (str.equals("룸")) {
			total = roomsDAO.getCount();
			pageCount = 10;// 따로 추가사항(한 페이지당 10개 게시물)
		}
		if (str.equals("라이프")) {
			total = lifestyleDAO.countAll();
		}
		if (str.equals("식당")) {
		}
		if (str.equals("QnA")) {
			total=qnaDAO.getCount();
		}
		if (str.equals("예약상품")) {
			total = reservationAdmDAO.getCount();
		}
		if (str.equals("예약회원")) {
			total = reservationDAO.getCount();
			//pageCount = 10;
		}
		if (str.equals("레스토랑")) {
			total = restaurantsDAO.getCount();
		}

		if (total % pageCount == 0) {
			lastPageNum = (int) Math.floor(total / pageCount);
		} else {
			lastPageNum = (int) Math.floor(total / pageCount) + 1;
		}
		paging.setLastPageNum(lastPageNum);
	}

	// 검색을 했을 때 총 페이지의 마지막 번호
	@Override
	public void makeLastPageNum(Paging paging, String str, String kwd, String col) {
		int total = 0;
		int lastPageNum = 0;
		int pageCount = paging.getPageCount();

		if (str.equals("회원")) {
			total = admDAO.getCount(kwd, col);
		}
		if (str.equals("룸")) {
			total = roomsDAO.getCount(kwd, col);
			pageCount = 10;// 따로 추가사항(한 페이지당 10개 게시물)
		}
		if (str.equals("라이프")) {
			total = lifestyleDAO.getCount(kwd);
		}
		if (str.equals("식당")) {
		}
		if (str.equals("QnA")) {
	//		total = qnaDAO.getCount();
		}
		if (str.equals("예약상품")) {
			total = reservationAdmDAO.getCount();
		}
		if (str.equals("예약회원")) {
			total = reservationDAO.getCount();
		}
		if (str.equals("레스토랑")) {
			total = restaurantsDAO.getCount();
		}

		if (total % pageCount == 0) {
			lastPageNum = (int) Math.floor(total / pageCount);
		} else {
			lastPageNum = (int) Math.floor(total / pageCount) + 1;
		}
		paging.setLastPageNum(lastPageNum);
		System.out.println("PagingService: " + lastPageNum);
		pageCount = 5;
	}
}
