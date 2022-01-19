package kr.artbay.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayAtt;
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
		page.setSort(sort);
		vo = service.view(lot);
		mv.addObject("vo", vo);
		List<ArtBayAtt> att = new ArrayList<ArtBayAtt>();
		for(int i=0; i<vo.getAttList().size(); i++) {
			att.add(vo.getAttList().get(i));
		}
		mv.addObject("att", att);
		mv.addObject("page", page);
		mv.setViewName("bid.view");
		return mv;
	}
}
