package com.delluna.hotels.ui_adm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.dataservice_adm.IAdmDAO;
import com.delluna.hotels.manage_paging.IPagingService;
import com.delluna.hotels.util.Paging;


@Controller
public class MemberAdmController {
	@Autowired IAdmDAO admDAO;
	@Autowired @Qualifier("pagingService") IPagingService pagingService;
	
	@RequestMapping("/adm/adm-member/{no}")
    public ModelAndView gotoAdmMember(@PathVariable int no) {
		Member member = admDAO.memberDetail(no);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-member.css");
		mv.addObject("js","adm/adm-member.js");
		mv.addObject("member",member);
		mv.setViewName("adm/adm-member");
		return mv;
    }

	@GetMapping("/adm/adm-member-list")
    public ModelAndView gotoAdmMemberList(@RequestParam(value = "page", required=false, defaultValue = "1")int page, @RequestParam(value = "kwd", required=false) String kwd, @RequestParam(value = "col", required=false) String col) {
		Paging paging = new Paging();
		
		paging = pagingService.makeBlock(page);
		List<Member> memberList = null;
		
		if(kwd == null) {
			pagingService.makeLastPageNum(paging,"회원");
			memberList = admDAO.admMemberList(page, 5,"id", "");
		}
		else {
			pagingService.makeLastPageNum(paging,"회원",kwd, col);
			memberList = admDAO.admMemberList(page, 5,col,kwd);
		}
		
		Integer blockStartNum = paging.getBlockStartNum();
		Integer blockLastNum = paging.getBlockLastNum();
		Integer lastPageNum = paging.getLastPageNum();
		
		
		

		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-member.css");
		mv.addObject("js","adm/adm-member.js");
		mv.addObject("blockStartNum",blockStartNum);
		mv.addObject("blockLastNum",blockLastNum);
		mv.addObject("lastPageNum",lastPageNum);
		mv.addObject("memberList",memberList);
		mv.addObject("kwd",kwd);
		mv.addObject("col",col);
		mv.addObject("curPageNum",page);
		mv.setViewName("adm/adm-member-list");
		return mv;
    }
	
	@GetMapping("/adm/adm-member-update/{no}")
    public ModelAndView gotoAdmMemberUpdateReady(@PathVariable int no) {
		Member member = admDAO.memberDetail(no);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("css","adm/adm-member.css");
		mv.addObject("js","adm/adm-member.js");
		mv.addObject("member",member);
		mv.setViewName("adm/adm-member-update");
		return mv;
    }
	
	@PostMapping("/adm/adm-member-update/complete")
	public ModelAndView gotoAdmMemberUpdate(@ModelAttribute Member member) {
		int check = admDAO.memberEdit(member);
		int no = member.getNo(); 
		
		ModelAndView mv = new ModelAndView();;
		mv.addObject("css","adm/adm-member.css");
		mv.addObject("js","adm/adm-member.js");
		mv.addObject("no",no);
		mv.addObject("check",check);
		mv.setViewName("adm/adm-member-update-complete");
		return mv;
    }
	
    
}
