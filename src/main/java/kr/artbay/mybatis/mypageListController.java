package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Controller
@RequestMapping("/")
public class mypageListController {

	@Autowired
	mypageListService service;
	
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
	@RequestMapping(value="/mypageBid", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidList(Page page) { //req로 받지 않아도 변수들 다 세팅해서 가져옴
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = service.mypageBidList(page); //service=>dao역할
		page = service.getPage();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("mypage.Bid");
		
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
	@RequestMapping(value="/mypageSuccessBid", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView sBidList(Page page) { 
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = service.mypageSuccessBidList(page); 
		page = service.getPage();
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("mypage.SuccessfulBid");
		return mv;
	}
	
	
}