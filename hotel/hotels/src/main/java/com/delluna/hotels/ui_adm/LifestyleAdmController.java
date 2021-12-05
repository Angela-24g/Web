package com.delluna.hotels.ui_adm;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.manage_lifestyle.LifestyleAdmService;
import com.delluna.hotels.manage_paging.IPagingService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.Paging;
import com.delluna.hotels.util.RESULTCODE;

@Controller
public class LifestyleAdmController {
	
	@Autowired @Qualifier("lifestyleAdmService") LifestyleAdmService lifestyleAdmService;
	@Autowired(required=false) @Qualifier("pagingService") IPagingService pagingService;
	
	@RequestMapping("/adm/lifestyle/write")
	public ModelAndView gotoAdmLifestyleWrite() {
		ModelAndView mv = new ModelAndView();
		
		// 로그인 + 등급에 따라 접근여부
		BusinessResult br = lifestyleAdmService.gotoAdmLifestyleWrite();
		if(!(br.getCode()==RESULTCODE.정상)) {
			if(br.getCode()==RESULTCODE.접근불가등급) {
				mv.setViewName("redirect:/adm/index");
				mv.addObject(br.getMessage());
				return mv;
			}
		}
		
		mv.addObject("css","adm/adm-lifestyle.css");
		//mv.addObject("js","adm/adm.js");
		mv.setViewName("adm/adm-lifestyle-write");
		return mv;
	}
	
	@RequestMapping("/adm/lifestyle/register")
	public ModelAndView registerLifestyle(@ModelAttribute Lifestyle lifestyle,HttpServletRequest request) {
		lifestyleAdmService.registerLifestyle(lifestyle, request);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-lifestyle.css");
		//mv.addObject("js","adm/adm.js");
		mv.setViewName("redirect:/adm/lifestyle/list");
		return mv;
	}
	
	@RequestMapping("/adm/lifestyle/list")
	public ModelAndView gotoAmdLifestyleList(@RequestParam(value = "page", required=false, defaultValue = "1")int page, @RequestParam(value = "col", required=false) String col, @RequestParam(value = "kwd", required=false) String kwd) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("kwd",kwd);
		mv.addObject("col",col);
		mv.addObject("curPageNum",page);
		mv.addObject("css","adm/adm-lifestyle.css");
		mv.addObject("js","adm/adm-lifestyle.js");
		mv.setViewName("adm/adm-lifestyle-list");
		
		BusinessResult br = lifestyleAdmService.gotoAmdLifestyleList(page,col,kwd);
		
		if(!(br.getCode()==RESULTCODE.정상)) {
			if(br.getCode()==RESULTCODE.존재하지않는검색결과) {//검색 결과가 없다면 리턴하기
				return mv;
			}
		}
		
		List<Lifestyle> lifestyles = (List<Lifestyle>)br.getValue();
		
		Paging paging = pagingService.makeBlock(page);
		
		if(kwd == null) {//검색한 내용이 없다면 전체
			pagingService.makeLastPageNum(paging,"라이프");
		}
		else {//있다면 필터
			pagingService.makeLastPageNum(paging,"라이프",kwd,col);
		}
		
		int blockStartNum = paging.getBlockStartNum();
		int blockLastNum = paging.getBlockLastNum();
		int lastPageNum = paging.getLastPageNum();
		
		mv.addObject("curPageNum",page);
		mv.addObject("blockStartNum", blockStartNum);
		mv.addObject("blockLastNum", blockLastNum);
		mv.addObject("lastPageNum", lastPageNum);
		mv.addObject("lifestyles",lifestyles);
		return mv;
		
	}
	
	@RequestMapping("/adm/lifestyle/view/{no}")
	public ModelAndView gotoAdmLifestyleview(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		BusinessResult br = lifestyleAdmService.gotoAmdLifestyleView(no);
		HashMap<String,Object> map = (HashMap<String,Object>)br.getValue();
		
		int countAll = (Integer)map.get("countAll");
		Lifestyle lifestyle = (Lifestyle)map.get("lifestyle");
		
		mv.addObject("countAll",countAll);
		mv.addObject("css","adm/adm-lifestyle.css");
		mv.addObject("lifestyle", lifestyle);
		mv.setViewName("adm/adm-lifestyle-view");
		return mv;
	}
	
	@RequestMapping("/adm/lifestyle/delete/{no}")
	public ModelAndView deleteLifestyle(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		BusinessResult br = lifestyleAdmService.deleteLifestyle(no);
		
		mv.setViewName("redirect:/adm/lifestyle/list");
		return mv;
	}
	
	@RequestMapping("/adm/lifestyle/goUpdate/{no}")
	public ModelAndView gotoUpdateLifestyle(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		BusinessResult br = lifestyleAdmService.gotoUpdateLifestyle(no);
		Lifestyle lifestyle = (Lifestyle)br.getValue();
		
		mv.addObject("css","adm/adm-lifestyle.css");
		mv.addObject("lifestyle", lifestyle);
		mv.setViewName("/adm/adm-lifestyle-update");
		return mv;
	}
	@RequestMapping("/adm/lifestyle/update")
	public ModelAndView updateLifestyle(Lifestyle lifestyle,HttpServletRequest request) {
		BusinessResult br = lifestyleAdmService.updateLifestyle(lifestyle,request);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/adm/lifestyle/view/"+lifestyle.getNo());
		return mv;
		
	}
	
}
