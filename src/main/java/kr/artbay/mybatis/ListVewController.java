package kr.artbay.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/bidList", method= {RequestMethod.POST})
	public ModelAndView bidList() {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = service.search(page);
		page = service.getPage();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("bid.list");
		return mv;
	}

	@RequestMapping(value="/bidView", method= {RequestMethod.POST})
	public ModelAndView bidView(int lot, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.view(lot);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		List<ArtBayAtt> att = new ArrayList<ArtBayAtt>();
		att.addAll(vo.getAttList());
		mv.addObject("att", att);
		mv.setViewName("bid.view");
		return mv;
	}
}
