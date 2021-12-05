package com.delluna.hotels.manage_restaurants;

import java.net.ConnectException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.dataservice_restaurants.IRestaurantsDAO;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Service("restaurantService")
public class RestaurantService implements IRestaurantService {
	@Autowired
	IRestaurantsDAO restaurantsDAO;
	@Autowired
	IMemberDAO memberDAO;

	@Override
	@Transactional
	public BusinessResult gotoNyx() {
		return new BusinessResult();
	}

	@Override
	@Transactional
	public BusinessResult gotoNam() {
		return new BusinessResult();
	}

	@Override
	@Transactional
	public BusinessResult gotoSakca() {
		return new BusinessResult();
	}

	@Override
	@Transactional
	public BusinessResult gotoRestaurantsReserv(@RequestParam String rtName, HttpSession session) {
		return new BusinessResult();
	}

	@Override
	@Transactional
	public BusinessResult saveRestaurantsReserv(@ModelAttribute Restaurants restaurants) {
		try {
			restaurantsDAO.save(restaurants);
		} catch (Exception e) {
			if (e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR, "네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return new BusinessResult(restaurants);
	}

	@Override
	@Transactional
	public BusinessResult saveRestaurantsNonReserv(RestaurantsNon restaurantsNon) {
		System.out.println("5");
		try {
			System.out.println("6");
			restaurantsDAO.saveNon(restaurantsNon);
		} catch (Exception e) {
			if (e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR, "네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return new BusinessResult(restaurantsNon);
	}

	@Override
	public BusinessResult deleteRestaurants(int no) {
		try {
			restaurantsDAO.delete(no);
		} catch (Exception e) {
			if (e instanceof ConnectException) {
				return new BusinessResult(RESULTCODE.NETWORK_ERROR, "네트워크 통신이 원활하지 않습니다.");
			}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return null;
	}

}
