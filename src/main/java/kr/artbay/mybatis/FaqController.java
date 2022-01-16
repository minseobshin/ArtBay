package kr.artbay.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Controller
@RequestMapping("/")
public class FaqController {

	@Autowired
	FaqService service;

	AES aes = new AES();
	Page page = new Page();
	ArtBayVo vo = null;
	boolean b = false;


	@RequestMapping(value="/customerFaq", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView faqList(String ctgr) { //req로 받지 않아도 변수들 다 세팅해서 가져옴
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list  = service.faqList(ctgr); //service=>dao역할
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("customer.FAQ");
		
		return mv;
	}
	
}
