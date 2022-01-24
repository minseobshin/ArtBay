package kr.artbay.mybatis;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kr.artbay.common.AES;
import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Controller
@RequestMapping("/")
public class ListVewController {

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
			Page page){
		ModelAndView mv = new ModelAndView();
		vo = service.view(lot);
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
		
		//작가의 다른 작품들
		ArtBayVo voOthers = new ArtBayVo();
		voOthers = service.viewOthers(lot);
		List<ArtBayAtt> others = voOthers.getAttList();
		
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
	
}
