package kr.artbay.mybatis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@RestController
public class mypageListController {

	@Autowired
	mypageListService service;
	ArtBaySessionVo sv = null;
	ArtBayVo vo = null;
	
	 
	/*
	@RequestMapping(value="/mypageListView", method= {RequestMethod.POST})
	public ModelAndView ListView(int lot, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.listView(lot);
		mv.addObject("vo", vo);
		mv.addObject("Page", page);
		mv.setViewName("mypage.listView");
		return mv;
	}
	*/
	//응찰내역
	@RequestMapping(value="/mypageBid")
	public ModelAndView bidList(Page page, ArtBaySessionVo sv, HttpServletRequest req) { //req로 받지 않아도 변수들 다 세팅해서 가져옴
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		try {
		String mid = (String)session.getAttribute("mid");
		page.setMid(mid);
		List<ArtBayVo> list = service.mypageBidList(page); //service=>dao역할
		page = service.getPage();
		
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.setViewName("mypage.Bid");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	//응찰작품 상세내역
	@RequestMapping(value="/bidListView", method= {RequestMethod.POST, RequestMethod.GET}) //value=요청한 경로
	public ModelAndView bidListview(int serial, int lot,  Page page) {
		ModelAndView mv = new ModelAndView();
	
		vo = service.bidListView(serial, lot);
		mv.addObject("vo", vo);
		mv.addObject("Page", page);
		mv.setViewName("mypage.ListView"); //응답할 view이름. 경로. 뷰페이지 이동. value랑 관계없음
		return mv;
	}
	//낙찰내역
	@RequestMapping(value="/mypageSuccessBid")
	public ModelAndView sBidList(Page page, ArtBaySessionVo sv, HttpServletRequest req) { 
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		String mid = (String)session.getAttribute("mid");
		page.setMid(mid);
		List<ArtBayVo> list = service.mypageSuccessBidList(page); 
		page = service.getPage();
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("mypage.SuccessfulBid");
		return mv;
	}
	
	
}