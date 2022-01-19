package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayVo;

@RestController
public class FaqController {

	@Autowired
	FaqService service;
	ArtBayVo vo = null;
	List<ArtBayVo> list;
	
	//faq 조회
	@RequestMapping(value="/faqList", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView faqList(String ctgr) { //req로 받지 않아도 변수들 다 세팅해서 가져옴
		ModelAndView mv = new ModelAndView();
		if(ctgr == null) {
			ctgr="general";
			list  = service.faqList(ctgr); 
		}else {
			list  = service.faqList(ctgr); //service=>dao역할
			ctgr = service.getCtgr();
		}
		mv.addObject("ctgr", ctgr);
		mv.addObject("list", list);
		mv.setViewName("customer.FAQ");
		
		return mv;
	}
	
}
