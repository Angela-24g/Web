package com.delluna.hotels.ui_adm;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;
import com.delluna.hotels.dataservice_notice.IQnaDAO;
import com.delluna.hotels.manage_paging.IPagingService;

@Controller
public class NoticeAdmController {
	@Autowired IQnaDAO qnaDAO;
	@Autowired @Qualifier("pagingService") IPagingService pagingService;

	
	//질문 리스트 만들기
	@RequestMapping("/adm/adm-qna-list")
		public ModelAndView listBoard(String pageNum,String qna, String orderBy,String resp,HttpSession session) {
	
		
		ModelAndView mv = new ModelAndView();
		//pageNum이 안넘어오면 무조건 페이지는 1페이지로 해놔라
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10; //페이지당 10개씩 표시
		int currentPage = Integer.parseInt(pageNum);// 현재 페이지
		
		int startRow = (currentPage-1)*pageSize+1;  //페이지의 첫번째 행 (1~10, 11~20, 21~30)
		int endRow = currentPage*pageSize; //페이지의 마지막 행 
		
		int count=0; //총 글 개수 넣을 변수
		int pageBlock = 10; //페이지당 블럭 블럭당 10개의 페이지
		
		count=qnaDAO.getCount();
		int number = count-(currentPage-1)*pageSize; //글이 37개이면, 37이 먼저(역순)
	
		int start = startRow-1;
		int cnt = pageSize;
		//총 페이지 수 구하기
		int pageCount = count/pageSize+(count%pageSize==0?0:1); //37개 일 경우, 몫(3) 나머지 나오니까 +1 하기 총 4페이지가 된다.
		//					몫				꽁다리 레코드
			
		int startPage = (currentPage/pageBlock)*10+1;//블럭의 시작페이지
		int endPage = startPage+pageBlock-1; //블럭의 끝 페이지
			
			List<Qna> list = qnaDAO.SelectALL(start, cnt); //myBatis를 사용해서 데이터를 가져오겠다! map은 매개변수로, 결과를 받았다!
			mv.addObject("qlist",list);
		 //일단은 최신순
	
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm-qna.js");
		
		
		mv.addObject("pageNum",pageNum);
		mv.addObject("currentPage",currentPage);
		
		mv.addObject("startRow",startRow);
		mv.addObject("endRow",endRow);
		
		mv.addObject("pageBlock",pageBlock);
		mv.addObject("pageCount", pageCount);
		
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		mv.addObject("count", count);
		mv.addObject("pageSize", pageSize);
		
		mv.addObject("number", number);//글번호
		System.out.println(pageNum);
		session.setAttribute("count", count);
		mv.setViewName("/adm/adm-qna-list");
		
		return mv;
		
	}
	
	
	//질문 삭제
	@RequestMapping(value="/adm/adm-qna-delete", method=RequestMethod.POST)
	public String deleteqlist(@RequestParam("idlist") List<String> idlist
			/* @RequestBody Map<String,Object> idlist*/) {
		
		for(int i=0;i<idlist.size();i++)
		{
			Qna qna = qnaDAO.findByNo(Integer.parseInt(idlist.get(i)));
			qnaDAO.delete(qna.getNo());
			qnaDAO.deleteR(qna.getNo());
			qnaDAO.udState("답변대기","답변대기",Integer.parseInt(idlist.get(i)));
			System.out.println(Integer.parseInt(idlist.get(i)));
		}
		
		return "redirect:/adm/adm-qna-list";
	}

	//답변등록창
	@RequestMapping("/adm/adm-rqna-write/{no}")
	public ModelAndView gotoAdmRqnaForm(@PathVariable int no){
		
		Qna qna = qnaDAO.findByNo(no); 
		Qnares qnares = new Qnares();
		qnares.setSubject(qna.getTitle());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("qno",no);
		mv.addObject("title",qna.getTitle());
		mv.addObject("date",qna.getWdate());
		mv.addObject("content",qna.getContents());
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm-qna.js");
	
		mv.setViewName("adm/adm-rqna-write");
		
		return mv;
	}
	//답변등록하기(db에 저장)
	@RequestMapping(value="/adm/adm-rqna-save",method=RequestMethod.POST)
	public String gotoAdmRqnawrite(Qnares qnares,String rqna,String name,HttpServletRequest request)
	{
		
		String num =request.getParameter("no");
		int qno = Integer.parseInt(num);
		
		//이전 qno랑 비교하여 있을 경우, 바로 리스트로 넘길 것
				qnares.setQno(qno);
				qnares.setSubject(name);
			    qnares.setReponse(rqna);
				qnares.setQstate("답변완료");
				String state = qnares.getQstate();
			
				qnaDAO.saverqna(qnares);
				qnaDAO.udState(state,state,qnares.getQno());
			
		return "redirect:/adm/adm-rqna-list";
	}
	//질문 상세 보기(관리자)
	@RequestMapping("/adm/adm-qna-view")
	public ModelAndView gotoAdmqnaview(){

		ModelAndView mv = new ModelAndView(); 
		
		
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		mv.setViewName("adm/adm-qna-view");
		return mv;
	}
	@RequestMapping(value="/adm/adm-qna-state",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> state(@RequestBody Map<String,Object> map) {
		String data=null;
		
		List<String> lists = (List<String>) map.get("clck");
		for(int i=0;i<lists.size();i++)
		{
			
			data = lists.get(i).toString();
		}
		
		Qna qna = qnaDAO.findByNo(Integer.parseInt(data));
		int bno = qna.getNo();
		
		String sresult = qna.getQsts();
		
		int go = (sresult.equals("답변완료"))?1:-1;
		map.put("rno", go);
		map.put("bno",bno);
/*		List<Object> list = new ArrayList<>(map.values());
		System.out.println(list.get(0));
		
		
/*		List<Object> list = new ArrayList<Object>(map.keySet());
		System.out.println(list);
		
		for(int i=0;i<=list.size();i++)
		{
			System.out.println(list.get(i));
		}
		*/
		return map;
	}
	//답변리스트 만들기
	@RequestMapping("/adm/adm-rqna-list")
	public ModelAndView rqnaList(Qnares qnares,Qna qna,String pageNum) {
	
			//pageNum이 안넘어오면 무조건 페이지는 1페이지로 해놔라
			if(pageNum==null) {
				pageNum="1";
			}
			
			int pageSize=10; //페이지당 10개씩 표시
			int currentPage = Integer.parseInt(pageNum);// 현재 페이지
			
			int startRow = (currentPage-1)*pageSize+1;  //페이지의 첫번째 행 (1~10, 11~20, 21~30)
			int endRow = currentPage*pageSize; //페이지의 마지막 행 
			
			int count=0; //총 글 개수 넣을 변수
			int pageBlock = 10; //페이지당 블럭 블럭당 10개의 페이지
			
			count=qnaDAO.qrCount();
			int number = count-(currentPage-1)*pageSize; //글이 37개이면, 37이 먼저(역순)
		
			int start = startRow-1;
			int cnt = pageSize;
			//총 페이지 수 구하기
			int pageCount = count/pageSize+(count%pageSize==0?0:1); //37개 일 경우, 몫(3) 나머지 나오니까 +1 하기 총 4페이지가 된다.
			//					몫				꽁다리 레코드
				
			int startPage = (currentPage/pageBlock)*10+1;//블럭의 시작페이지
			int endPage = startPage+pageBlock-1; //블럭의 끝 페이지
			
			List<Qnares> list = qnaDAO.Select(start, cnt); //myBatis를 사용해서 데이터를 가져오겠다! map은 매개변수로, 결과를 받았다!
			List<Qna> rlist = qnaDAO.SelectALL(start, cnt);
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("css", "adm/adm.css");
			mv.addObject("js", "adm/adm-qna.js");
			
			mv.addObject("qrlist",list);			
			mv.addObject("qlist",rlist);
			
			mv.addObject("pageNum",pageNum);
		
			mv.addObject("currentPage",currentPage);
			
			mv.addObject("startRow",startRow);
			mv.addObject("endRow",endRow);
			
			mv.addObject("pageBlock",pageBlock);
			mv.addObject("pageCount", pageCount);
			
			
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			
			mv.addObject("count", count);
			System.out.println(count);
			mv.addObject("pageSize", pageSize);
			
			mv.addObject("number", number);//글번호

			mv.setViewName("/adm/adm-rqna-list");
		
		return mv;
	}

	//답변 수정 폼
	@RequestMapping("/adm/adm-rqna-edit/{no}")
	public ModelAndView rqnaEdit(Qnares qnares, Qna qna)
	{
	
		qna = qnaDAO.findByNo(qna.getNo());
		qnares = qnaDAO.findByQno(qnares.getNo());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("no",qna.getNo());
		mv.addObject("content",qna.getContents());
		mv.addObject("title",qna.getTitle());
		mv.addObject("response",qnares.getResponse());
		mv.addObject("css", "adm/adm.css");
		mv.addObject("js", "adm/adm.js");
		
		mv.setViewName("/adm/adm-rqna-edit");
		return mv;
	}
	//답변 수정 폼(답변 관리에서 하는 것)
		@RequestMapping("/adm/adm-rqna-rowedit/{no}")
		public ModelAndView rqnaEdit(@PathVariable("no") int no)
		{
			System.out.println("dklfjd");
			Qna qna = qnaDAO.findByNo(no);
			Qnares qnares = qnaDAO.findByQno(no);
			
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("title",qna.getTitle());
			mv.addObject("content",qna.getContents());
			mv.addObject("response",qnares.getResponse());
			mv.addObject("sign","sign");
			mv.addObject("css", "adm/adm.css");
			mv.addObject("js", "adm/adm.js");
			
			mv.setViewName("/adm/adm-rqna-edit");
			return mv;
		}
	//답변 수정(db)
		@RequestMapping("/adm/adm-rqna-update")
		public String updateRqnalist(String content,int no) {
			System.out.println(content);
			System.out.println(no);
			qnaDAO.udateResp(content, no);
			return "redirect:/adm/adm-rqna-list";
		}
	//답변 삭제
		@RequestMapping(value="/adm/adm-rqna-delete", method=RequestMethod.POST)
		public String deleteRqlist(@RequestParam("idlist") List<String> idlist
				/* @RequestBody Map<String,Object> idlist*/) {
			System.out.println(idlist);
			for(int i=0;i<idlist.size();i++)
			{
				Qnares qnares = qnaDAO.findByQno(Integer.parseInt(idlist.get(i)));
				
				qnaDAO.deleteResp(qnares.getNo());
				System.out.println(qnares.getNo());
				qnaDAO.udState("답변대기","답변대기",Integer.parseInt(idlist.get(i)));
				System.out.println(Integer.parseInt(idlist.get(i)));
			}
			
			
		//	System.out.println(idlist.get("idlist"));
			return "redirect:/adm/adm-rqna-list";
		}
	
}