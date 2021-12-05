package com.delluna.hotels.manage_restaurants;

import javax.servlet.http.HttpSession;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.util.BusinessResult;

public interface IRestaurantService {
	// 레스토랑 닉스 바로가기
	BusinessResult gotoNyx();

	// 레스토랑 남 바로가기
	BusinessResult gotoNam();

	// 레스토랑 사카에 바로가기
	BusinessResult gotoSakca();

	// 레스토랑 예약글 작성 바로가기
	BusinessResult gotoRestaurantsReserv(String rtName, HttpSession session);

	// 레스토랑 예약글 작성 저장하기
	BusinessResult saveRestaurantsReserv(Restaurants restaurants);

	// 레스토랑 예약글 삭제하기
	BusinessResult deleteRestaurants(int no);

	BusinessResult saveRestaurantsNonReserv(RestaurantsNon restaurantsNon);

}
