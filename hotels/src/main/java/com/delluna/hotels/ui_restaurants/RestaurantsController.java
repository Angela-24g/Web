package com.delluna.hotels.ui_restaurants;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.dataservice_member.IMemberMapper;
import com.delluna.hotels.manage_restaurants.IRestaurantService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class RestaurantsController {
	@Autowired
	@Qualifier("restaurantService")
	IRestaurantService restaurantService;

	@Autowired
	IMemberMapper memberMapper;

	@RequestMapping(value = { "/restaurants", "/restaurants-nyx" })
	public ModelAndView gotoNyx(HttpSession session, HttpServletResponse response) {
		BusinessResult br = restaurantService.gotoNyx();
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}

		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("no") != null) {
			Member member = null;
			int member_no = (Integer) session.getAttribute("no");
			member = memberMapper.findByNo(member_no);
			mv.addObject("member_no", member_no);
		} else {
			String value = null;
			Cookie setCookie = new Cookie("name", value); // 쿠키 이름을 name으로 생성
			setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정(60초 * 60분 * 24시간)
			response.addCookie(setCookie); // response에 Cookie 추가
		}
		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("js", "facility/restaurants.js");
		mv.setViewName("facility/restaurants-nyx");
		return mv;
	}

	@RequestMapping(value = { "/restaurants-nam" })
	public ModelAndView gotoNam() {
		BusinessResult br = restaurantService.gotoNam();
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("js", "facility/restaurants.js");
		mv.setViewName("facility/restaurants-nam");
		return mv;
	}

	@RequestMapping(value = { "/restaurants-sakca" })
	public ModelAndView gotoSakca() {
		BusinessResult br = restaurantService.gotoSakca();
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("js", "facility/restaurants.js");
		mv.setViewName("facility/restaurants-sakca");
		return mv;
	}

	@GetMapping(value = { "/restaurants-reserve" })
	public ModelAndView gotoRestaurantsReserv(@RequestParam String rtName, HttpSession session,
			HttpServletRequest request) {
		BusinessResult br = restaurantService.gotoRestaurantsReserv(rtName, session);
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}
		// 회원이면??
		Member member = null;

		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("no") != null) {
			int member_no = (Integer) session.getAttribute("no");
			member = memberMapper.findByNo(member_no);
			mv.addObject("member_no", member_no);

		} else {
			Cookie[] getCookie = request.getCookies(); // 모든 쿠키 가져오기
			System.out.println(getCookie);
			String name = null;
			String value = null;
			if (getCookie != null) { // 만약 쿠키가 없으면 쿠키 생성
				for (int i = 0; i < getCookie.length; i++) {
					Cookie c = getCookie[i]; // 객체 생성
					name = c.getName(); // 쿠키 이름 가져오기
					value = c.getValue(); // 쿠키 값 가져오기
					System.out.println("name : " + name);
					System.out.println("value : " + value);
					mv.addObject("cooName", name);
					mv.addObject("cooVal", value);
				}
			}
		}
		mv.addObject("rtName", rtName);
		mv.addObject("member", member);
		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("js", "facility/restaurants-reserve.js");
		mv.setViewName("facility/restaurants-reserve");
		return mv;
	}

	@RequestMapping(value = "/restaurants-reserve", method = RequestMethod.POST)
	public ModelAndView saveRestaurantsReserv(@ModelAttribute Restaurants restaurants, @ModelAttribute RestaurantsNon restaurantsNon, HttpServletRequest request) {
		System.out.println("1");
		Cookie[] getCookie = request.getCookies(); // 모든 쿠키 가져오기
		System.out.println("2");
		BusinessResult br = null;
		if(getCookie==null) {
			System.out.println("3");
			br = restaurantService.saveRestaurantsReserv(restaurants);
		}else {
			System.out.println("4");
			br = restaurantService.saveRestaurantsNonReserv(restaurantsNon);
		}
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("rtState", restaurants.getState());
		mv.addObject("rtDate", restaurants.getDate_reserve());
		mv.setViewName("facility/restaurants-result");
		return mv;

	}

	@GetMapping("/restaurants-delete/{no}")
	public ModelAndView deleteRestaurants(@PathVariable int no) {
		BusinessResult br = restaurantService.deleteRestaurants(no);
		if (br.getCode() != RESULTCODE.정상) {
			// 비정상처리
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("css", "facility/restaurants.css");
		mv.addObject("js", "facility/restaurants.js");
		mv.setViewName("facility/restaurants-list");// 아직없음
		return mv;
	}

}
