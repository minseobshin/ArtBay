package kr.artbay.mybatis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServlet;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@Component
public class ListViewController {

	@Autowired
	ListViewService service;
	AES aes = new AES();
	Page page = new Page();
	ArtBayVo vo = null;
	boolean b = false;
	
	@RequestMapping(value="/bidList", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidList(@RequestParam(value="findStr", required=false) String findStr,
			@RequestParam(value="cnt", required=false, defaultValue="10") int cnt,
			@RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage,
			@RequestParam(value="sort", required=false, defaultValue="default") String sort) {
		ModelAndView mv = new ModelAndView();
		page.setListSize(cnt);
		page.setFindStr(findStr);
		page.setNowPage(nowPage);
		page.setSort(sort);
		List<ArtBayVo> list = service.search(page, findStr);
		for(ArtBayVo vo : list) {
			vo.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
			vo.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
			vo.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
		}
		page = service.getPage();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("bid.list");
		return mv;
	}

	@RequestMapping(value="/bidView", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidView(@RequestParam(value="lot", required=false) int lot,
			@RequestParam(value="nowPage", required=false) int nowPage,
			@RequestParam(value="sort", required=false) String sort,
			Page page, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();	
		//현재가를 최고가로 업데이트하기
		int cnt = service.updateCurrentPrice();
		
		//상세 조회 화면 불러오기
		vo = service.view(lot);
		
		//전체 응찰 내역 불러오기
		mv = viewBidHistory(lot);
		
		vo.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
		vo.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
		vo.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
		page.setSort(sort);
		mv.addObject("vo", vo);
		List<ArtBayAtt> att = new ArrayList<ArtBayAtt>();
		for(int i=0; i<vo.getAttList().size(); i++) {
			att.add(vo.getAttList().get(i));
		}
		mv.addObject("att", att);
		
		//작가의 다른 작품들 사진 불러오기
		ArtBayVo voOthers = new ArtBayVo();
		voOthers = service.viewOthers(lot);
		List<ArtBayAtt> others = voOthers.getAttList();
		
		//내 응찰 내역 불러오기
		List<ArtBayVo> realList = new ArrayList<ArtBayVo>();
		realList = viewBidMyHistory(lot, req);
		
		mv.addObject("myHistory", realList);
		mv.addObject("others", others);
		mv.addObject("page", page);
		mv.setViewName("bid.view");
		return mv;
	}
	
	@RequestMapping(value="/bidApplied", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidApplied(ArtBaySessionVo sv, HttpServletRequest req,
		@RequestParam(value="lot", required=false) int lot,
		@RequestParam(value="price_combo", required=false) String price) {
		ModelAndView mv = new ModelAndView();
		ArtBayVo vo = new ArtBayVo();
		vo = service.view(lot);
	      
		HttpSession session = req.getSession();
		String mid = (String) session.getAttribute("mid");
		vo.setMid(mid);
		vo.setBid_price(Integer.parseInt(price));
		int cnt = service.bidApply(vo);
		mv.addObject("vo", vo);
		mv.setViewName("bid.view");
		return mv;
	   }
	
	@RequestMapping(value="/bidViewHistory", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView viewBidHistory(int lot) {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		List<ArtBayVo> realList = new ArrayList<ArtBayVo>();
		list = scheduler();
		for(ArtBayVo vo : list) {
			if(vo.getLot()==lot) {
				realList.add(vo);
			}
		}
		
		mv.addObject("history", realList);
		mv.setViewName("bid.view");
		return mv;
	}
	
	public List<ArtBayVo> viewBidMyHistory(int lot, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		List<ArtBayVo> realList = new ArrayList<ArtBayVo>();
		list = scheduler();
		
		HttpSession session = req.getSession();
		String mid = (String) session.getAttribute("mid");
		for(ArtBayVo vo : list) {
			if(vo.getLot()==lot && vo.getMid().equals(mid)) {
				realList.add(vo);
			}
		}
		return realList;
	}

	/*
	@RequestMapping(value="/bidLoadMyHistory", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidViewMyHistory(@RequestParam(value="lot", required=false) int lot,
			HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		mv = viewBidMyHistory(lot, req);
		
		mv.setViewName("bid.view");
		return mv;
	}
	*/
	@Scheduled(cron="*/5 * * * * *")
	public List<ArtBayVo> scheduler() {
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		list = service.viewBidsAll();
		return list;
	}
	
}
