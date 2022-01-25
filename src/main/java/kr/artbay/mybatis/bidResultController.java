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
bidResultService rService;
ListViewService service;
ArtBayVo vo = null;
Page page;

//bidResult
@RequestMapping(value="/bidResult", method= {RequestMethod.POST, RequestMethod.GET})
public ModelAndView bidResult(Page page, 
		@RequestParam(value="rSort", required=false, defaultValue="asc") String rSort ) { 
	ModelAndView mv = new ModelAndView();
	page.setrSort(rSort);
	List<String> list = rService.bidResult(page); //service=>dao역할
	mv.addObject("page", page);
	mv.addObject("list", list);
	mv.setViewName("bid.Result");
	return mv;
}
@RequestMapping(value="/bidWinList", method= {RequestMethod.POST, RequestMethod.GET})
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
}
