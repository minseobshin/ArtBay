package kr.artbay.mybatis;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Controller
@RequestMapping("/")
public class bidResultController {
	
@Autowired
bidResultService service;
ArtBayVo vo = null;
Page page = new Page();
//bidResult 월별 낙찰
@RequestMapping(value="/bidResult", method= {RequestMethod.POST, RequestMethod.GET})
public ModelAndView bidResult(Page page, 
		@RequestParam(value="rSort", required=false, defaultValue="default") String rSort ) { 
	ModelAndView mv = new ModelAndView();
	
	List<ArtBayVo> list = service.bidResult(page); //service=>dao역할
	page = service.getPage();
	mv.addObject("page", page);
	mv.addObject("list", list);
	mv.setViewName("bid.Result");
	return mv;
}
//월별 낙찰 상세보기
@RequestMapping(value="/bidResultList", method= {RequestMethod.POST, RequestMethod.GET})
public ModelAndView bidResultList(Page page) {
	ModelAndView mv = new ModelAndView();
	System.out.println("안녕하세요:"+page.getR_date());
	List<ArtBayVo> list = service.bidResultsearch(page);
	page = service.getPage();
	for(ArtBayVo v : list) {
		vo.setStr_start_price(NumberFormat.getInstance().format(v.getStart_price()));
		vo.setStr_current_price(NumberFormat.getInstance().format(v.getCurrent_price()));
		vo.setStr_bid_cnt(NumberFormat.getInstance().format(v.getBid_cnt()));
	}
	mv.addObject("vo", vo);
	mv.addObject("page", page);
	mv.addObject("list", list);
	mv.setViewName("bid.list");

	return mv;
}	
}
