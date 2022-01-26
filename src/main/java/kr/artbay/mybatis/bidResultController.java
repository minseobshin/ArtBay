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
public ModelAndView bidWinList(Page page, ArtBayVo vo) {
	ModelAndView mv = new ModelAndView();
	page.setR_date(vo.getDue_date());
	page = service.getPage();
	List<ArtBayVo> list = service.bidResultsearch(page);
	for(ArtBayVo v : list) {
		v.setStr_start_price(NumberFormat.getInstance().format(vo.getStart_price()));
		v.setStr_current_price(NumberFormat.getInstance().format(vo.getCurrent_price()));
		v.setStr_bid_cnt(NumberFormat.getInstance().format(vo.getBid_cnt()));
	}
	mv.addObject("page", page);
	mv.addObject("list", list);
	mv.setViewName("bid.list");

	return mv;
}	
}
