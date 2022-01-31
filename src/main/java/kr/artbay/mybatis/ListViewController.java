package kr.artbay.mybatis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
import kr.artbay.scheduler.GetTime;
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
	
	/* 원본 지킴이
	@RequestMapping(value="/bidList", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidList(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		
		int cnt=1;
		String findStr="";
		int nowPage=1;
		String sort="default";
		try {
			if(req.getParameter("cnt") == null) cnt=1;
			else cnt = Integer.parseInt(req.getParameter("cnt"));
			
			if(req.getParameter("findStr") == null) findStr="";
			else findStr = req.getParameter("findStr");
			
			if(req.getParameter("nowPage") == null) nowPage=1;
			else nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
			if (req.getParameter("sort") == null) sort="default";
			else sort = req.getParameter("sort");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		page.setListSize(cnt);
		page.setFindStr(findStr);
		page.setNowPage(nowPage);
		page.setSort(sort);
		list = service.search(page, findStr);
		
		for(ArtBayVo vo : list) {
			vo.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
			if(vo.getCurrent_price()==null) vo.setCurrent_price(vo.getStart_price());
			vo.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
			vo.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
			if(vo.getDirect_price()!=null) vo.setStr_direct_price(NumberFormat.getInstance().format(vo.getDirect_price()));
		}
		
		page = service.getPage();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("bid.list");
		return mv;
	}
	 */
	
	@RequestMapping(value="/bidList", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bidList(@RequestParam(value="findStr", required=false) String findStr,
			@RequestParam(value="cnt", required=false, defaultValue="10") int cnt,
			@RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage,
			@RequestParam(value="sort", required=false, defaultValue="default") String sort) {
		ModelAndView mv = new ModelAndView();
		page.setListSize(cnt);			//페이징 처리 클래스의 페이지 당 조회 건수 변경
		page.setFindStr(findStr);		//페이징 처리 클래스의 검색어 변경
		page.setNowPage(nowPage);		//페이징 처리 클래스의 현재 페이지 변경
		page.setSort(sort);				//페이징 처리 클래스의 정렬 방식 변경
		List<ArtBayVo> list = service.search(page, findStr);		//페이징 처리 클래스를 변수로 하는 service 호출
		
		for(ArtBayVo vo : list) {
			vo.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
			if(vo.getCurrent_price()==null) vo.setCurrent_price(vo.getStart_price());
			vo.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
			vo.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
			if(vo.getDirect_price()!=null) vo.setStr_direct_price(NumberFormat.getInstance().format(vo.getDirect_price()));
			vo.setStr_bid_price(NumberFormat.getInstance().format(vo.getBid_price()));
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

		//상세 조회 화면 불러오기
		vo = service.view(lot);
		
		//전체 응찰 내역 불러오기
		mv = viewBidHistory(lot);
		
		//남은 시간 설정하기
			String dueDate = vo.getDue_date();
			int year = Integer.parseInt(dueDate.substring(0, 4));
			int month = Integer.parseInt(dueDate.substring(5, 7));
			int day = Integer.parseInt(dueDate.substring(8, 10));
			
			LocalDateTime dt = LocalDateTime.of(year, month, day, 00, 00, 00);
			
			//localDate 지금, 기한
			LocalDate nowDate = LocalDate.now();
			LocalDate dd = dt.toLocalDate();
			
			Period periodDate = Period.between(nowDate, dd);
			int diffYear = periodDate.getYears();
			int diffMonth = periodDate.getMonths();
			int diffDay = periodDate.getDays();
						
			//localTime 지금, 기한
			LocalDateTime nowTime = LocalDateTime.now();
			LocalTime dueTime = dt.toLocalTime();
			
			diffYear = (int) ChronoUnit.YEARS.between(nowTime, dt);
			diffMonth = (int) ChronoUnit.MONTHS.between(nowTime, dt);
			diffDay = (int) ChronoUnit.DAYS.between(nowTime, dt);
			
			int diffHr = (int) ChronoUnit.HOURS.between(nowTime, dt);
			if(diffHr>24) diffHr = diffHr/24;
			int diffMin = (int) ChronoUnit.MINUTES.between(nowTime, dt);
			if(diffMin>60) {
				int min = diffMin/60;
				diffMin = diffMin - 60*min;
			}
			
			int diffSec = (int) ChronoUnit.SECONDS.between(nowTime, dt);
			if(diffSec>60) {
				int sec = diffSec/60;
				diffSec = diffSec - 60*sec;
			}
			if((diffYear|diffMonth|diffDay|diffHr|diffMin|diffSec)<0) {
				vo.setRemaining_year(-1);
				vo.setCrnt_status("경매종료");
				service.updateStatus(vo.getLot());
			}else {				
				vo.setRemaining_year(diffYear);
				vo.setRemaining_month(diffMonth);
				vo.setRemaining_day(diffDay);
				vo.setRemaining_hr(diffHr);
				vo.setRemaining_min(diffMin);
				vo.setRemaining_sec(diffSec);
			}
			
		//숫자 반점 표기
		vo.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
		
			//응찰이 없을 경우 시작가를 가져와서 현재가로 표시
		if(vo.getCurrent_price()==null) vo.setCurrent_price(vo.getStart_price());
		vo.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
		
		vo.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
		
			//즉시 판매일 경우
		if(vo.getDirect_price()!=null) vo.setStr_direct_price(NumberFormat.getInstance().format(vo.getDirect_price()));
		
		vo.setStr_bid_price(NumberFormat.getInstance().format(vo.getBid_price()));
		
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
				vo.setStr_bid_price(NumberFormat.getInstance().format(vo.getBid_price()));
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
				vo.setStr_bid_price(NumberFormat.getInstance().format(vo.getBid_price()));
				realList.add(vo);
			}
		}

		return realList;
	}
	
	
	@RequestMapping(value="/bidDirect", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView directPurchase(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArtBayVo vo = new ArtBayVo();
		vo.setLot(Integer.parseInt(req.getParameter("lot")));
		vo = service.getDirectInfo(vo.getLot());
		vo.setCurrent_price(vo.getDirect_price());
		vo.setCrnt_status("경매종료");
		//낙찰자 아이디 가져오기
		HttpSession session = req.getSession();
		String mid = (String) session.getAttribute("mid");
		vo.setMid(mid);
		vo.setWinbid_price(vo.getDirect_price());
		GetTime date = new GetTime();
		vo.setWinbid_date(date.getDate()+"");
		vo.setBid_type("direct");
		service.directPurchase(vo);
		mv.addObject("vo", vo);
		mv.setViewName("bid.view");
		return mv;
	}

	//5초마다 실행되도록 스케줄러
	@Scheduled(cron="*/5 * * * * *")
	public List<ArtBayVo> scheduler() {
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		//경매 내역 조회
		list = service.viewBidsAll();
		
		//경매 기한이 지나면 경매 종료로 변경
		GetTime date = new GetTime();
		service.updateStatusAll(date.getDate());
		return list;
	}
	
}
